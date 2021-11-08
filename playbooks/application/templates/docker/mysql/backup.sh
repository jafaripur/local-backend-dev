#!/bin/bash

#$1=db name
#$2=backup file

# sh ./backup.sh db_name backup_file.sql

docker exec {{docker_mysql_container}} /usr/bin/mysqldump -u root -p $1 > $2