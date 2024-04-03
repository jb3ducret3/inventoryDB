#!bin/bash
cd inventaireDB
python3 -m venv venv
source venv/bin/activate
export psswd=$(docker run --rm --name apache httpd:alpine htpasswd -nb admin corsic)
docker build -t inventaireDB debian:latest .
docker-compose up -d
