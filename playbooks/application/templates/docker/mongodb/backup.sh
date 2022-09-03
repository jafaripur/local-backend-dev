#!/bin/bash

TODAY=`date +%F`
 
DB_HOST='localhost'
DB_PORT=27017
 
DB_BACKUP_PATH='/data/backup'

docker exec {{docker_mongodb_container}} mongodump --host $DB_HOST --port $DB_PORT \
      --username root --password {{vault_mongodb_root_password}} \
      --authenticationDatabase admin \
      --gzip \
      --out "$DB_BACKUP_PATH/${TODAY}/"