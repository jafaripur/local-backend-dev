#!/bin/bash

PORT=9000
GOOS=linux #darwin, windows
GOARCH=amd64 #386

if [ "$1" = "make" ]; then
	docker run --rm \
           --network {{docker_network_internal}} \
           -v "${PWD}:/usr/src/myapp" \
           -v {{docker_files_path}}/go/cache:/root/.cache \
           -v {{docker_files_path}}/go/gopath:/go \
           --workdir /usr/src/myapp \
           -e GOOS=$GOOS \
           -e GOARCH=$GOARCH \
           --memory {{docker_go_memory}} \
           {{docker_go_image_build}} \
           make "$@"
else
    docker run -it --init --rm \
           --network {{docker_network_internal}} \
           -p 127.0.0.1:$PORT:8080 \
           -v "${PWD}:/usr/src/myapp" \
           -v {{docker_files_path}}/go/cache:/root/.cache \
           -v {{docker_files_path}}/go/gopath:/go \
           --workdir /usr/src/myapp \
           -e GOOS=$GOOS \
           -e GOARCH=$GOARCH \
           --memory {{docker_go_memory}} \
           {{docker_go_image_build}}:latest \
           go "$@"
fi