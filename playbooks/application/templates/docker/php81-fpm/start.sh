#!/bin/bash

docker run -it -d \
           --name {{docker_php81fpm_container}} \
           --network {{docker_network_internal}} \
           -v "{{php_project_path}}:/var/www/html" \
           -v "{{docker_files_path}}/php81-fpm/config/php/php-custom.ini:/usr/local/etc/php/conf.d/99-php-custom.ini:ro" \
           -v "{{docker_files_path}}/php81-fpm/config/pools/:/usr/local/etc/php-fpm.d:ro" \
           --workdir /var/www/html \
           --restart unless-stopped \
           --log-driver json-file \
           --log-opt max-size=10m \
           --log-opt max-file=5 \
           --memory {{docker_php81fpm_memory}} \
           --cpus 1 \
           {{docker_php81fpm_image_build}}:latest