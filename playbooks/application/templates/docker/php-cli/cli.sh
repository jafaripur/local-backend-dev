#!/bin/bash

docker run -it --rm \
           --network {{docker_network_internal}} \
           -v $PWD:/project-files \
           -v {{docker_files_path}}/php-cli/config/php-custom.ini:/usr/local/etc/php/conf.d/99-custom.ini \
           --workdir /project-files \
           -u $(id -u ${USER}):$(id -g ${USER}) \
           --log-driver json-file \
           --log-opt max-size=10m \
           --log-opt max-file=5 \
           --memory {{docker_phpcli_memory}} \
           {{docker_phpcli_image_build}}:latest \
           php "$@"