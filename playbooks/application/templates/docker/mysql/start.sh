#!/bin/bash

docker run -it -d \
           --name {{docker_mysql_container}} \
           --network {{docker_network_internal}} \
           -v "{{docker_files_path}}/mysql/config:/etc/mysql/conf.d" \
           -v "{{docker_files_path}}/mysql/data/db:/var/lib/mysql" \
           -v "{{docker_files_path}}/mysql/data/log:/var/log/mysql" \
           -e "MYSQL_ROOT_PASSWORD={{vault_mysql_root_password}}" \
           --restart unless-stopped \
           --memory {{docker_mysql_memory}} \
           --cpus 1 \
           {{docker_mysql_image}} \
           --character-set-server=utf8mb4 \
           --collation-server=utf8mb4_unicode_ci