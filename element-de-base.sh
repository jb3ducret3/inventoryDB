#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
ip_local=$(hostname -I | awk '{print $1}')
sudo apt install docker.io -y
sudo apt install docker-compose -y
sudo apt-get install python3-venv -y 
sudo apt install python3-pip -y 
chmod +x lancement-conteneur.sh
./lancement-conteneur.sh
