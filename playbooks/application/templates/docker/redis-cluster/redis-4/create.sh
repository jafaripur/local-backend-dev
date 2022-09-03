#!/bin/bash

docker run --init -d \
           --name "redis-4" \
           --network {{docker_network_internal}} \
           -v "{{docker_files_path}}/redis-cluster/redis-4/data:/data" \
           -v "{{docker_files_path}}/redis-cluster/redis-4/config/redis.conf:/opt/bitnami/redis/mounted-etc/redis.conf:ro" \
           -e "REDIS_PASSWORD={{vault_redis_password}}" \
           -e "REDISCLI_AUTH={{vault_redis_password}}" \
           -e "ALLOW_EMPTY_PASSWORD=no" \
           -e "REDIS_NODES=redis-1 redis-2 redis-3 redis-4 redis-5 redis-6" \
           --restart unless-stopped \
           --memory 500MB \
           bitnami/redis-cluster:7.0-debian-11