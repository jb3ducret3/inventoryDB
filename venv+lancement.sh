#!bin/bash
cd inventaireDB
python3 -m venv venv
source venv/bin/activate
docker build -t inventaireDB debian:latest .
export psswd=$(docker run --rm --name apache httpd:alpine htpasswd -nb admin corsic)
docker-compose up -d
