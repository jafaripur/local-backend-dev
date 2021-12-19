#!/bin/bash

docker run -it -d \
           --name {{docker_php8fpm_container}} \
           --network {{docker_network_internal}} \
           -v "{{php_project_path}}:/var/www/html" \
           -v "{{docker_files_path}}/php8-fpm/config/php/:/usr/local/etc/php/conf.d:ro" \
           -v "{{docker_files_path}}/php8-fpm/config/pools/:/usr/local/etc/php-fpm.d:ro" \
           --workdir /var/www/html \
           --restart unless-stopped \
           --log-driver json-file \
           --log-opt max-size=10m \
           --log-opt max-file=5 \
           --memory {{docker_php8fpm_memory}} \
           --cpus 1 \
           {{docker_php8fpm_image_build}}:latest