#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install docker.io -y
sudo apt install docker-compose -y
sudo apt-get install python3-venv -y 
sudo apt install python3-pip -y 
chmod +x lancement-conteneur.sh
./lancement-conteneur.sh
