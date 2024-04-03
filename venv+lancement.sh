#!bin/bash
cd inventaireDB
python3 -m venv venv
source venv/bin/activate
docker build -t inventaireDB debian:latest .
export psswd=$(docker run --rm --name apache httpd:alpine htpasswd -nb admin corsic)
export PRIVATE_IP=$(ip route get 1 | awk '{print $NF;exit}'):8888
docker-compose up -d
