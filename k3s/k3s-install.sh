#!/bin/bash

# Mise à jour du système et installation de packages
sudo apt update -y
sudo apt upgrade -y
sudo apt install curl -y
sudo apt install openssh-client -y

# Installation de K3s
curl -sfL https://get.k3s.io | sh -
K3S_TOKEN=$(cat /var/lib/rancher/k3s/server/token)
K3S_URL="http://10.10.10.10:6443"

# Déploiement des nœuds ouvriers
ssh worker@node1 "curl -sfL https://get.k3s.io | K3S_URL=$K3S_URL K3S_TOKEN=$K3S_TOKEN sh -"

# Installation de Kompose
curl -L https://github.com/kubernetes/kompose/releases/download/v1.16.0/kompose-linux-amd64 -o kompose
chmod +x kompose
sudo mv kompose /usr/local/bin/kompose

# Conversion des fichiers Docker Compose en manifestes Kubernetes
cd /home/inventairedb/
kompose convert

# Déplacement des fichiers convertis dans un répertoire k3s
mkdir -p k3s
mv *.yaml k3s/

# Application des manifestes Kubernetes
kubectl apply -f k3s/

# Vérification des nœuds
kubectl get nodes

# Vérification de l'application déployée
curl inventairedb.localhost

if [ $? -ne 0 ]; then
    echo "Erreur lors de la vérification de l'application déployée."
    exit 1
fi

# Nom du référentiel sur Docker Hub
repository="userdockerhub/repository"

# Liste des images à tagger et à pousser
images=("inventairedb" "dnsserveur")

# Parcourir la liste des images
for image in "${images[@]}"; do
    # Tagger l'image avec le nom du référentiel et le tag correspondant
    docker tag "$image:latest" "$repository:$image"
    
    # Pousser l'image taggée vers Docker Hub
    docker push "$repository:$image"
done
