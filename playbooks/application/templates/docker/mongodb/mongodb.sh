#!/bin/bash

docker exec -it {{docker_mongodb_container}} mongo "$@"