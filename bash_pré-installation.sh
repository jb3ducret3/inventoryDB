#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install docker.io -y
sudo apt install docker-compose -y?
sudo apt install python3 venv -y ?
sudo apt install python3-pip -y ?
sudo app install git -y
sudo git init
sudo git clone github.com/jb3ducret3/inventaireDB
mkdir inventaireDB
docker build -t inventaireDB debian:latest .
chmod +x venv+lancement.sh
./venv_lancement.sh
