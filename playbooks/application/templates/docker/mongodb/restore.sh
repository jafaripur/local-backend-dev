#!/bin/bash

DB_HOST='localhost'
DB_PORT=27017

read -p "Date with yyyy-mm-dd format (2022-05-22): " BACKUP_DATE

# $1 Should be of format yyyy-mm-dd
DB_BACKUP_PATH="/data/backup/${BACKUP_DATE}"

docker exec -it {{docker_mongodb_container}} mongorestore $DB_BACKUP_PATH --host $DB_HOST --port $DB_PORT \
    --username root --password {{vault_mongodb_root_password}} \
    --authenticationDatabase admin \
    --gzip \
    --drop \
    --preserveUUID