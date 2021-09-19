#!/bin/bash

export DOCKER_BUILDKIT=1 && docker build -f {{docker_files_path}}/php-cli/Dockerfile -t {{docker_phpcli_image_build}}:latest {{docker_files_path}}/php-cli/ 