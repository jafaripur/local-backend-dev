#!/bin/bash

docker exec -t {{docker_nginx_container}} nginx -s reload