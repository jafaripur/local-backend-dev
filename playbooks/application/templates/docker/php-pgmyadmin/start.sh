#!/bin/bash

docker run -it -d \
           --name {{docker_php_pgmyadmin_container}} \
           --network {{docker_network_internal}} \
           -p 127.0.0.1:{{docker_php_pgmyadmin_external_port}}:8080 \
           -v "{{docker_files_path}}/php-pgmyadmin/data:/bitnami" \
           -e "DATABASE_HOST={{docker_postgres_container}}" \
           -e "PHP_ENABLE_OPCACHE=yes" \
           --restart unless-stopped \
           --memory {{docker_php_pgmyadmin_memory}} \
           --cpus 1 \
           {{docker_php_pgmyadmin_image}}