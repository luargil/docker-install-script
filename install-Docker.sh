#!/bin/bash

# Define the packages to remove
packages=("docker.io" "docker-doc" "docker-compose" "docker-compose-v2" "podman-docker" "containerd" "runc")

# Remove the specified packages
for pkg in "${packages[@]}"; do
    sudo apt-get remove -y "$pkg"
done

# Add Docker's official GPG key
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install Docker packages
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Run a test container
sudo docker run hello-world

# Enable Docker to start on boot
sudo systemctl enable docker.service
# sudo systemctl enable containerd.service

# Add the current user to the docker group
sudo groupadd docker
sudo usermod -aG docker $USER
sudo newgrp docker

# Notify the user that everything is done
echo "Docker has been installed and configured."

# chmod +x install-Docker.sh

 
 
