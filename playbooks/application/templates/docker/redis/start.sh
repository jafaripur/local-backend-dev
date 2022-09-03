#!/bin/bash

docker run -it -d \
           --name {{docker_redis_container}} \
           --network {{docker_network_internal}} \
           -v "{{docker_files_path}}/redis/data:/data" \
           -v "{{docker_files_path}}/redis/config/redis.conf:/usr/local/etc/redis/redis.conf:ro" \
           --restart unless-stopped \
           --memory {{docker_redis_memory}} \
           --cpus 1 \
           {{docker_redis_image}} \
           redis-server /usr/local/etc/redis/redis.conf