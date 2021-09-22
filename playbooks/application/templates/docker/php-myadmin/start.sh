#!/bin/bash

docker run -it -d \
           --name {{docker_php_myadmin_container}} \
           --network {{docker_network_internal}} \
           -p 127.0.0.1:{{docker_php_myadmin_external_port}}:80 \
           -e "PMA_HOST={{docker_mysql_container}}" \
           --restart unless-stopped \
           --log-driver json-file \
           --log-opt max-size=10m \
           --log-opt max-file=5 \
           --memory {{docker_php_myadmin_memory}} \
           {{docker_php_myadmin_image}}
           
#-e MYSQL_ROOT_PASSWORD={{vault_mysql_root_password}} \