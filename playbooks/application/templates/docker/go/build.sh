#!/bin/bash

export DOCKER_BUILDKIT=1 && docker build -f "{{docker_files_path}}/go/Dockerfile" -t "{{docker_go_image_build}}:latest" "{{docker_files_path}}/go/"