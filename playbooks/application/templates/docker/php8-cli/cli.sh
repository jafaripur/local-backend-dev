#!/bin/bash

projectFolder="$(basename $PWD)"

docker run -it --init --rm \
           --network {{docker_network_internal}} \
           -v "${PWD}:/var/www/html/${projectFolder}" \
           -v {{docker_files_path}}/php8-cli/config/php-custom.ini:/usr/local/etc/php/conf.d/99-php-custom.ini:ro \
           --workdir "/var/www/html/${projectFolder}" \
           -u $(id -u ${USER}):$(id -g ${USER}) \
           --memory {{docker_php8cli_memory}} \
           {{docker_php8cli_image_build}}:latest \
           php "$@"