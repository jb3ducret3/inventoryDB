#!/bin/bash

# Constantes pour les paramètres de configuration
DNS_SERVER="8.8.8.8"
DOMAIN="inventairedb.localhost"
CACHE_SIZE="1000"

# Mise à jour des paquets
sudo apt update && sudo apt upgrade -y

# Installation de dnsmasq, dnsutils et ldnsutils
sudo apt install dnsmasq dnsutils ldnsutils -y

# Désactivation et arrêt de systemd-resolved
sudo systemctl disable --now systemd-resolved

# Configuration du fichier /etc/resolv.conf avec le serveur DNS par défaut
echo "nameserver $DNS_SERVER" | sudo tee /etc/resolv.conf

# Configuration de dnsmasq
DN_SMASQ_CONFIG="port=53
                domain-needed
                bogus-priv
                listen-address=127.0.0.1,$(hostname -I | awk '{print $1}')
                expand-hosts
                domain=$DOMAIN
                cache-size=$CACHE_SIZE"
echo "$DN_SMASQ_CONFIG" | sudo tee /etc/dnsmasq.conf

# Ajout de l'entrée pour le domaine dans /etc/hosts
echo "$(hostname -I | awk '{print $1}') $DOMAIN" | sudo tee -a /etc/hosts

# Redémarrage de dnsmasq
sudo systemctl restart dnsmasq

# Vérification du temps de réponse pour une requête DNS vers google.com
drill google.com | grep "Query time"
