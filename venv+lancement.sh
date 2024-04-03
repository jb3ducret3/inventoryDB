#!bin/bash
cd inventaireDB
export psswd=$(docker run --rm --name apache httpd:alpine htpasswd -nb admin corsic)
docker build -t inventaireDB debian:latest .
chmod +x bash_demarrage.sh
./bash_demarrage.sh
docker-compose up -d
