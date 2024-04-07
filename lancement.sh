#!/bin/bash

# Nettoyer le cache et mettre à jour le système
sudo apt clean
sudo apt update -y
sudo apt upgrade -y

# Installer Docker et Docker Compose
sudo apt install docker.io -y
sudo apt install docker-compose -y

# Installer Python et ses dépendances
sudo apt-get install python3-venv -y 
sudo apt install python3-pip -y 
mkdir PDF_CSV
# Construire l'image Docker de l'application Python
cd PYTHON
docker build -t inventairedb .
if [ $? -ne 0 ]; then
    echo "Erreur lors de la construction de l'image Docker pour l'application Python."
    exit 1
fi

cd ..
# Construire l'image Docker du serveur DNS
cd DNS/
docker build -t dnsserveur .
if [ $? -ne 0 ]; then
    echo "Erreur lors de la construction de l'image Docker pour le serveur DNS."
    exit 1
fi

# Revenir au répertoire racine du projet
#cd ..

# Démarrer les conteneurs avec Docker Compose
docker-compose up -d
if [ $? -ne 0 ]; then
    echo "Erreur lors du démarrage des conteneurs avec Docker Compose."
    exit 1
fi

echo "Les conteneurs ont été démarrés avec succès."
