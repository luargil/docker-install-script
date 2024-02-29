#!/bin/bash

# Define the packages to remove
packages=("docker-ce" "docker-ce-cli" "containerd.io" "docker-buildx-plugin" "docker-compose-plugin")

# Remove the specified packages
for pkg in "${packages[@]}"; do
    sudo apt-get remove -y "$pkg"
done

sudo apt remove docker-* --auto-remove -y

sudo rm -rf /var/lib/docker

sudo groupdel docker

sudo rm -rf /var/run/docker.sock

sudo rm -rf /usr/local/bin/docker-compose && sudo rm -rf /etc/docker && sudo rm -rf ~/.docker

echo "Docker is removed"