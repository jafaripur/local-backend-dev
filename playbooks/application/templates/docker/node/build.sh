#!/bin/bash

export DOCKER_BUILDKIT=1 && docker build --pull --no-cache -f "{{docker_files_path}}/node/Dockerfile" -t "{{docker_node_image_build}}:latest" "{{docker_files_path}}/node/" 