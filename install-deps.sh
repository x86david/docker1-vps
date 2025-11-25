#!/bin/bash
set -e
    
# Update system
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git ca-certificates lsb-release

# Install Docker
curl -fsSL https://get.docker.com | sudo sh
sudo systemctl enable docker
sudo systemctl start docker

# Add current user to docker group
sudo usermod -aG docker $USER

# Install Docker Compose plugin
sudo apt install -y docker-compose-plugin

echo "✅ Docker and Docker Compose installed. Log out and back in so docker group changes take effect."
