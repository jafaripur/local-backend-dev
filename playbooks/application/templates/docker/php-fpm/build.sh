#!/bin/bash

docker build -f {{docker_files_path}}/php-fpm/Dockerfile -t {{docker_phpfpm_image_build}}:latest {{docker_files_path}}/php-fpm/ 