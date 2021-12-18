#!/bin/bash

docker run -it -d \
           --name {{docker_redis_container}} \
           --network {{docker_network_internal}} \
           -v "{{docker_files_path}}/redis/data:/data" \
           -v "{{docker_files_path}}/redis/config/redis.conf:/usr/local/etc/redis/redis.conf" \
           --restart unless-stopped \
           --log-driver json-file \
           --log-opt max-size=10m \
           --log-opt max-file=5 \
           --memory {{docker_redis_memory}} \
           --cpus 1 \
           {{docker_redis_image}} \
           redis-server /usr/local/etc/redis/redis.conf