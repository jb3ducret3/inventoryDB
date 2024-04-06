#!/bin/bash
ip_local=$(hostname -I | awk '{print $1}')
# Mise à jour des paquets
sudo apt update
sudo apt upgrade -y
# Installation de dnsmasq, dnsutils et ldnsutils
sudo apt install dnsmasq dnsutils ldnsutils -y
# Désactivation et arrêt de systemd-resolved
sudo systemctl disable --now systemd-resolved
# Configuration du fichier /etc/resolv.conf avec Google DNS (8.8.8.8)
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf

# Configuration de dnsmasq
echo "port=53 domain-needed bogus-priv listen-address=127.0.0.1,$ip_local expand-hosts domain=inventairedb.localhost cache-size=1000" | sudo tee /etc/dnsmasq.conf

# Ajout de l'entrée pour inventairedb.local dans /etc/hosts
echo "$ip_local inventairedb.localhost" | sudo tee -a /etc/hosts

# Redémarrage de dnsmasq
sudo systemctl restart dnsmasq

# Vérification du temps de réponse pour une requête DNS vers google.com
drill google.com | grep "Query time"
