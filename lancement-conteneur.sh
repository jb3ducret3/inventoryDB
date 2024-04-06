#!/bin/bash
sudo apt-get update
# Installation de dnsmasq
export psswd=$(docker run --rm --name apache httpd:alpine htpasswd -nb admin techosgringos)
export PRIVATE_IP=$(ip route get 1 | awk '{print $NF;exit}'):8888 
docker build -t inventairedb .
docker-compose up -d
chmod +x dnsmasq.sh
./dnsmasq.sh
