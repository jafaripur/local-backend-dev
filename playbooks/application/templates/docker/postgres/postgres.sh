#!/bin/bash

docker exec -it {{docker_postgres_container}} psql -U postgres "$@"