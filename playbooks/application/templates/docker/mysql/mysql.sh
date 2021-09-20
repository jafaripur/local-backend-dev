#!/bin/bash

docker exec -it {{docker_mysql_container}} mysql "$@"