#!/bin/bash
# CREATE SWAP
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cat /etc/fstab swap swap defaults 0 0 >>/swapfile

# INSTALL SSH CONNECT
mkdir -p ~/.ssh
echo '${var.ssh_public_key}' >>~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
service ssh restart

# INSTALL DOCKER
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# INSTALL DOCKER COMPOSE
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
