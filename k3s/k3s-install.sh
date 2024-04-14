#!/bin/bash

# Mise à jour du système et installation de packages
sudo apt update -y
sudo apt upgrade -y
sudo apt install curl -y
sudo apt install openssh-client -y

# Installation de K3s
# Télécharge et installe K3s
curl -sfL https://get.k3s.io | sh -

# Récupération de l'adresse IP locale de l'interface réseau principale (eth0)
K3S_IP=$(ip -o -4 addr show eth0 | awk '{print $4}' | cut -d "/" -f 1)
# Crée l'URL pour accéder à K3s
K3S_URL="http://$K3S_IP:6443"
# Récupère le jeton d'authentification K3s
K3S_TOKEN=$(cat /var/lib/rancher/k3s/server/token)

# Demande à l'utilisateur de saisir son nom d'utilisateur Docker et son mot de passe
read -p "Entrez votre nom d'utilisateur Docker : " DCK_LOG
read -sp "Entrez votre mot de passe Docker : " DCK_MDP
echo # Nouvelle ligne pour améliorer la lisibilité

# Se connecte à Docker Hub avec les informations d'identification fournies par l'utilisateur
docker login -u "$DCK_LOG" -p "$DCK_MDP"

# Tag et pousse les images Docker vers le référentiel Docker Hub de l'utilisateur
docker tag dnsserveur:latest "$DCK_LOG/projet:dnsserveur"
docker push "$DCK_LOG/projet:dnsserveur"

docker tag inventairedb:latest "$DCK_LOG/projet:inventairedb"
docker push "$DCK_LOG/projet:inventairedb"

# Applique les manifestes Kubernetes pour déployer les services
kubectl apply -f inventairedb.yml

# Ajoute des annotations aux déploiements Kubernetes pour configurer Traefik
kubectl annotate deployment inventairedb traefik.ingress.kubernetes.io/router.entrypoints=web
kubectl annotate deployment inventairedb traefik.ingress.kubernetes.io/router.rule="Host(`inventairedb.localhost`)"
