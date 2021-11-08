#!/bin/bash

#$1=db name
#$2=backup file

# sh ./restore.sh db_name backup_file.sql

cat $2 | docker exec -i {{docker_mysql_container}} /usr/bin/mysql -u root -p $1