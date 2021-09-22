#!/bin/bash

export DOCKER_BUILDKIT=1 && docker build -f "{{docker_files_path}}/php-fpm/Dockerfile" -t "{{docker_phpfpm_image_build}}:latest" "{{docker_files_path}}/php-fpm/"