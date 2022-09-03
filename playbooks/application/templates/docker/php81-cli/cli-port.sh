#!/bin/bash

projectFolder="$(basename $PWD)"

read -p "Target port: " targetPort
read -p "Publish port: " publishPort

docker run -it --init --rm \
           --network {{docker_network_internal}} \
           -p "127.0.0.1:$publishPort:$targetPort" \
           -v "${PWD}:/var/www/html/${projectFolder}" \
           -v {{docker_files_path}}/php81-cli/config/php-custom.ini:/usr/local/etc/php/conf.d/99-php-custom.ini:ro \
           --workdir "/var/www/html/${projectFolder}" \
           -u $(id -u ${USER}):$(id -g ${USER}) \
           --memory {{docker_php81cli_memory}} \
           {{docker_php81cli_image_build}}:latest \
           php "$@"