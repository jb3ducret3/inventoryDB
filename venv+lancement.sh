#!/bin/bash
sudo apt-get update
# Installation de dnsmasq
sudo apt-get install dnsmasq -y
# Configuration de dnsmasq
echo "address=/local/$PRIVATE_IP" | sudo tee -a /etc/dnsmasq.conf
cd inventaireDB
python3 -m venv venv
source venv/bin/activate
docker build -t inventaireDB debian:latest .
export psswd=$(docker run --rm --name apache httpd:alpine htpasswd -nb admin corsic)
export PRIVATE_IP=$(ip route get 1 | awk '{print $NF;exit}'):8888
sudo systemctl restart dnsmasq
docker-compose up -d
