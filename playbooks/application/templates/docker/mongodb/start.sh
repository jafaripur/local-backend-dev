#!/bin/bash

#touch {{docker_files_path}}/mongodb/data/home/.dbshell
#chown -R 999:999 {{docker_files_path}}/mongodb/data/home
#chown -R 999:999 {{docker_files_path}}/mongodb/data/log
#sudo chown 999:999 {{docker_files_path}}/mongodb/config/keyfile

docker run -it -d \
           --name {{docker_mongodb_container}} \
           --network {{docker_network_internal}} \
           -p 127.0.0.1:{{docker_mongodb_external_port}}:27017 \
           -v "{{docker_files_path}}/mongodb/data/home:/home/mongodb" \
           -v "{{docker_files_path}}/mongodb/config/mongod.conf:/etc/mongod.conf:ro" \
           -v "{{docker_files_path}}/mongodb/config/keyfile:/data/keyfile:ro" \
           -v "{{docker_files_path}}/mongodb/data/db:/data/db" \
           -v "{{docker_files_path}}/mongodb/data/log:/var/log/mongodb" \
           --restart unless-stopped \
           --log-driver json-file \
           --log-opt max-size=10m \
           --log-opt max-file=5 \
           --ulimit nofile=64000:64000 \
           --ulimit nproc=64000:64000 \
           --memory {{docker_mongodb_memory}} \
           --cpus 1 \
           {{docker_mongodb_image}} --config /etc/mongod.conf