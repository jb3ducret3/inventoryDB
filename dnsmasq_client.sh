#!/bin/bash

# Mise à jour des paquets
sudo apt update
sudo apt upgrade -y

# Installation de dnsutils et ldnsutils
sudo apt-get install dnsutils ldnsutils -y

# Définir l'adresse IP distante et le domaine
IP_DISTANT="192.168.27.167"
DOMAINE="inventairedb.localhost"

# Ajout de l'adresse IP distante et du domaine à la configuration DNS
echo "nameserver $IP_DISTANT" | sudo tee /etc/resolv.conf
echo "search $DOMAINE" | sudo tee -a /etc/resolv.conf

# Vérification de la résolution DNS pour inventaire.local
dig $DOMAINE
