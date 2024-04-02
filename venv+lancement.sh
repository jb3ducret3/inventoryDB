#!/bin/bash

# Installer python3-venv si ce n'est pas déjà fait
sudo apt-get update

# Créer un nouvel environnement virtuel
python3 -m venv VenDB

# Activer l'environnement virtuel
source venv/bin/activate

# Installer Flask et ReportLab
pip install flask
pip install reportlab

# Installer tree pour la visualisation
sudo apt-get install tree

# Lancer le script Python
docker-compose up -d
