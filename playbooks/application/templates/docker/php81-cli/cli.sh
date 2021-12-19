#!/bin/bash

projectFolder="$(basename $PWD)"

docker run -it --rm \
           --network {{docker_network_internal}} \
           -v "${PWD}:/var/www/html/${projectFolder}" \
           -v {{docker_files_path}}/php81-cli/config/:/usr/local/etc/php/conf.d:ro \
           --workdir "/var/www/html/${projectFolder}" \
           -u $(id -u ${USER}):$(id -g ${USER}) \
           --memory {{docker_php81cli_memory}} \
           {{docker_php81cli_image_build}}:latest \
           php "$@"