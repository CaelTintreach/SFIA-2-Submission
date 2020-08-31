#!/bin/bash
sudo apt update && sudo apt install -y python3 python3-pip
mkdir -p ~/.local/bin
echo 'PATH=$PATH:~/.local/bin' >> ~/.bashrc
. ~/.bashrc
pip3 install --user ansible
ansible --version
ansible-playbook -v -i inventory.ini playbook.yaml