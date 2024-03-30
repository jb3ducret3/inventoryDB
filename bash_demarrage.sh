#!/bin/bash

# Installer python3-venv si ce n'est pas déjà fait
sudo apt-get update
sudo apt-get install python3-venv

# Créer un nouvel environnement virtuel
python3 -m venv venv

# Activer l'environnement virtuel
source venv/bin/activate

# Installer Flask et ReportLab
pip install flask
pip install reportlab

# Installer tree pour la visualisation
sudo apt-get install tree

# Lancer le script Python
python3 inventory.py
