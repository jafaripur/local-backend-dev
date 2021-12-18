#!/bin/bash

docker run -it -d \
           --name {{docker_postgres_container}} \
           --network {{docker_network_internal}} \
           -v "{{docker_files_path}}/postgres/data/db:/var/lib/postgresql/data" \
           -v "{{docker_files_path}}/postgres/data/home:/home/${USER}/" \
           -v "{{docker_files_path}}/postgres/config/postgres.conf:/etc/postgresql/postgresql.conf:ro" \
           -v "/etc/passwd:/etc/passwd:ro" \
           -e "POSTGRES_PASSWORD={{vault_postgres_password}}" \
           -e "PGDATA=/var/lib/postgresql/data/pgdata" \
           -u $(id -u ${USER}):$(id -g ${USER}) \
           --restart unless-stopped \
           --log-driver json-file \
           --log-opt max-size=10m \
           --log-opt max-file=5 \
           --memory {{docker_postgres_memory}} \
           --cpus 1 \
           {{docker_postgres_image}}