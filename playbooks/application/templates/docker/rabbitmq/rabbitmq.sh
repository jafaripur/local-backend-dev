#!/bin/bash

docker exec -t {{docker_rabbitmq_container}} rabbitmqctl "$@"