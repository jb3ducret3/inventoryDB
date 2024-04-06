#!/bin/bash

# Mise à jour des paquets
sudo apt update
sudo apt upgrade
IP_DISTANT=$IP_de_l_adresse_du_dns
# Installation de dnsutils et ldnsutils
sudo apt-get install dnsutils ldnsutils -y

# Modification du fichier /etc/resolv.conf pour ajouter l'adresse IP distante et le domaine inventaire.local
echo "$IP_DISTANT inventaire.local" >> /etc/resolv.conf

# Vérification de la résolution DNS pour inventaire.local
dig inventaire.local
