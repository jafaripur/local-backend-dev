#!/bin/bash

export DOCKER_BUILDKIT=1 && docker build -f "{{docker_files_path}}/php7-fpm/Dockerfile" -t "{{docker_php7fpm_image_build}}:latest" "{{docker_files_path}}/php7-fpm/"