#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt install openssh-server -y
sudo apt install openssh-client -y

sudo apt install ufw -y
sudo ufw enable
sudo ufw allow 4242/tcp

sudo apt install vim -y
sudo apt install git -y
sudo apt install curl -y

curl -4fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo apt-get install docker-compose