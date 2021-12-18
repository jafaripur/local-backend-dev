#!/bin/bash

export DOCKER_BUILDKIT=1 && docker build -f "{{docker_files_path}}/php8-fpm/Dockerfile" -t "{{docker_php8fpm_image_build}}:latest" "{{docker_files_path}}/php8-fpm/"