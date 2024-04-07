#!/bin/bash
sudo apt update
sudo apt upgrade
sudo apt clean

cd /PYTHON/
docker build -t inventairedb .

cd /inventaireDB/DNS/
docker build -t dnsserver .

cd ..
docker-compose -d up 
