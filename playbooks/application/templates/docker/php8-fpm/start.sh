#!/bin/bash

docker run -it -d \
           --name {{docker_php8fpm_container}} \
           --network {{docker_network_internal}} \
           -v "{{php_project_path}}:/var/www/html" \
           -v "{{docker_files_path}}/php8-fpm/config/php/php-custom.ini:/usr/local/etc/php/conf.d/99-php-custom.ini:ro" \
           -v "{{docker_files_path}}/php8-fpm/config/pools/:/usr/local/etc/php-fpm.d:ro" \
           --workdir /var/www/html \
           --restart unless-stopped \
           --memory {{docker_php8fpm_memory}} \
           --cpus 1 \
           {{docker_php8fpm_image_build}}:latest