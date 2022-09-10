#!/bin/bash

docker exec -it {{docker_mongodb_container}} mongosh --username root --password {{vault_mongodb_root_password}} --authenticationDatabase admin "$@"