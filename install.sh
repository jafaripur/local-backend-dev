#!/bin/sh

sudo apt-get install python3 python3-dist-utils python3-apt -y

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
sudo python3 -m pip install ansible
rm get-pip.py

ansible-galaxy role install -r ./requirements.yml --force
ansible-galaxy collection install -r ./requirements.yml --force