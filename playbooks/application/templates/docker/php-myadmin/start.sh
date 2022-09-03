#!/bin/bash

docker run -it -d \
           --name {{docker_php_myadmin_container}} \
           --network {{docker_network_internal}} \
           -p 127.0.0.1:{{docker_php_myadmin_external_port}}:80 \
           -e "PMA_HOST={{docker_mysql_container}}" \
           --restart unless-stopped \
           --memory {{docker_php_myadmin_memory}} \
           --cpus 1 \
           {{docker_php_myadmin_image}}
           
#-e MYSQL_ROOT_PASSWORD={{vault_mysql_root_password}} \