#!/bin/sh

sudo apt-get install python3 python3-dist-utils python3-apt -y

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
rm get-pip.py
python3 -m pip install --user ansible

ansible-galaxy role install -r ./requirements.yml --force
ansible-galaxy collection install -r ./requirements.yml --force