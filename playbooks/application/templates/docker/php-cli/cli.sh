#!/bin/bash

docker run -it --rm \
           --network {{docker_network_internal}} \
           -v "${PWD}:/var/www/html" \
           -v {{docker_files_path}}/php-cli/config/php-custom.ini:/usr/local/etc/php/conf.d/99-custom.ini \
           --workdir /var/www/html \
           -u $(id -u ${USER}):$(id -g ${USER}) \
           --memory {{docker_phpcli_memory}} \
           {{docker_phpcli_image_build}}:latest \
           php "$@"