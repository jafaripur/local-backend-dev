#!/bin/bash

PORT=9000
GOOS=linux #darwin, windows
GOARCH=amd64 #386

if [ "$1" = "make" ]; then
	docker run --rm \
           -v "${PWD}:/usr/src/myapp" \
           --workdir /usr/src/myapp \
           -e GOOS=$GOOS \
           -e GOARCH=$GOARCH \
           --memory {{docker_go_memory}} \
           {{docker_go_image}} \
           make "$@"
else
    docker run -it --rm \
           -p 127.0.0.1:$PORT:8080 \
           -v "${PWD}:/usr/src/myapp" \
           --workdir /usr/src/myapp \
           -e GOOS=$GOOS \
           -e GOARCH=$GOARCH \
           --memory {{docker_go_memory}} \
           {{docker_go_image}} \
           go "$@"
fi