#!/bin/bash

# Mise à jour des paquets
sudo apt update
sudo apt upgrade

# Installation de dnsmasq
sudo apt install dnsmasq -y

# Désactivation et arrêt de systemd-resolved
systemctl disable --now systemd-resolved

# Configuration du fichier /etc/resolv.conf avec Google DNS (8.8.8.8)
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Installation de dnsmasq, dnsutils et ldnsutils
apt-get install dnsmasq dnsutils ldnsutils -y

# Vérification du statut de dnsmasq
systemctl status dnsmasq

# Configuration de dnsmasq
echo "port=53
      domain-needed
      bogus-priv
      listen-address=127.0.0.1,$ip_local
      expand-hosts
      domain=inventaire.local
      cache-size=1000" > /etc/dnsmasq.conf

# Configuration du fichier /etc/resolv.conf avec l'adresse IP locale et dnsmasq
echo "nameserver $ip_local
      dnsmasq --test" > /etc/resolv.conf

# Redémarrage de dnsmasq
systemctl restart dnsmasq

# Ajout de l'entrée pour inventairedb.local dans /etc/hosts
echo "$ip_local inventairedb.local" >> /etc/hosts

# Vérification de la résolution DNS pour inventaire.local
dig inventaire.local+short

# Vérification du temps de réponse pour une requête DNS vers google.com
drill google.com | grep "Query time"
