#!/bin/bash
apt update apt upgrade -y
docker build -t monserveurdns .
#docker run -dit --name monserveurdns -p 53:53/udp monserveurdns
