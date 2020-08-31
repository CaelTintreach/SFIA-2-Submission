#!/bin/bash
sudo groupadd -f docker
sudo usermod -aG docker $(whoami)
sudo chmod 666 /var/run/docker.sock
docker-compose build
docker-compose push