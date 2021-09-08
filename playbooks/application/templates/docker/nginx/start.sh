#!/bin/bash

docker run -it -d \
           --name {{docker_nginx_container}} \
           -p 127.0.0.1:{{docker_nginx_external_port}}:80 \
           --network {{docker_network_internal}} \
           -v {{php_project_path}}:/var/www/html:ro \
           -v {{docker_files_path}}/nginx/conf.d:/etc/nginx/conf.d:ro \
           -v {{docker_files_path}}/nginx/snippets:/etc/nginx/snippets:ro \
           -v {{docker_files_path}}/nginx/h5bp:/etc/nginx/h5bp:ro \
           -v {{docker_files_path}}/nginx/runtime/logs:/var/log/nginx \
           -v {{docker_files_path}}/nginx/runtime/caches:/var/cache/nginx \
           -v {{docker_files_path}}/nginx/config/nginx.conf:/etc/nginx/nginx.conf:ro \
           --workdir /var/www/html \
           --restart unless-stopped \
           --log-driver json-file \
           --log-opt max-size=10m \
           --log-opt max-file=5 \
           --ulimit nofile=65536:65536 \
           --memory {{docker_nginx_container_memory}} \
           {{docker_nginx_image}}
           
           
docker network connect {{docker_network_external}} {{docker_nginx_container}}