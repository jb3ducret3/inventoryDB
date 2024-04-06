#!/bin/bash

# Mise à jour des paquets
sudo apt update
sudo apt upgrade
IP_DISTANT=$ip_local #adresses du dns, script a utiliser sur le client 
# Installation de dnsutils et ldnsutils
sudo apt-get install dnsutils ldnsutils -y

# Modification du fichier /etc/resolv.conf pour ajouter l'adresse IP distante et le domaine inventaire.local
echo "$IP_DISTANT inventairedb.localhost" >> /etc/resolv.conf

# Vérification de la résolution DNS pour inventaire.local
dig inventaire.local
