#!/bin/bash
ssh node-1 << EOF
git clone https://github.com/CaelTintreach/SFIA-2-Repair.git
EOF

ssh node-1 << EOF
pwd
whoami
git clone https://github.com/CaelTintreach/SFIA-2-Repair.git
cd SFIA-2-Repair
sudo docker pull caeltintreach/lgen:latest
sudo docker pull caeltintreach/ui1:latest
sudo docker pull caeltintreach/ngen:latest
sudo docker pull caeltintreach/pgen:latest
sudo docker pull nginx
sudo docker stack deploy --compose-file docker-compose.yaml stacktest
sudo docker images
sudo docker container ls -a
cd ..
rm -r SFIA-2-Repair
sudo docker stack services stacktest
EOF