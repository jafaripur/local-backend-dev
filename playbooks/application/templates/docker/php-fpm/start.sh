#!/bin/bash

docker run -it -d \
           --name {{docker_phpfpm_container}} \
           --network {{docker_network_internal}} \
           -v {{php_project_path}}:/var/www/html \
           -v {{docker_files_path}}/php-fpm/config/php-custom.ini:/usr/local/etc/php/conf.d/99-custom.ini \
           -v {{docker_files_path}}/php-fpm/config/www.conf:/usr/local/etc/php-fpm.d/www.conf \
           --workdir /var/www/html \
           --restart unless-stopped \
           --log-driver json-file \
           --log-opt max-size=10m \
           --log-opt max-file=5 \
           --memory {{docker_phpfpm_memory}} \
           {{docker_phpfpm_image_build}}:latest
           
docker network connect {{docker_network_external}} {{docker_nginx_container}}