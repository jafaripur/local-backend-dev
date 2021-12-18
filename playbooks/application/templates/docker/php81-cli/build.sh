#!/bin/bash

export DOCKER_BUILDKIT=1 && docker build -f "{{docker_files_path}}/php81-cli/Dockerfile" -t "{{docker_php81cli_image_build}}:latest" "{{docker_files_path}}/php81-cli/"