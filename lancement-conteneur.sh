#!/bin/bash
sudo apt-get update
# Installation de dnsmasq
export psswd=$(docker run --rm --name apache httpd:alpine htpasswd -nb admin techosgringos)
export PRIVATE_IP=$(ip route get 1 | awk '{print $NF;exit}'):8888
#sudo apt-get install dnsmasq -y
# Configuration de dnsmasq
#echo "address=/local/$PRIVATE_IP" | sudo tee -a /etc/dnsmasq.conf 
docker build -t inventairedb .
sudo systemctl restart dnsmasq
docker-compose up -d