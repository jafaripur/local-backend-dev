#!/bin/bash

docker run -it -d \
           --name {{docker_mysql_container}} \
           --network {{docker_network_internal}} \
           -v "{{docker_files_path}}/mysql/config:/etc/mysql/conf.d" \
           -v "{{docker_files_path}}/mysql/data/db:/var/lib/mysql" \
           -v "{{docker_files_path}}/mysql/data/log:/var/log/mysql" \
           -e "MYSQL_ROOT_PASSWORD={{vault_mysql_root_password}}" \
           --restart unless-stopped \
           --log-driver json-file \
           --log-opt max-size=10m \
           --log-opt max-file=5 \
           --memory {{docker_mysql_memory}} \
           {{docker_mysql_image}} \
           --character-set-server=utf8mb4 \
           --collation-server=utf8mb4_unicode_ci