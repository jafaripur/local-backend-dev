#!/bin/bash

docker network create --driver overlay --attachable {{docker_network_internal}}

docker network create --driver overlay --attachable {{docker_network_external}}