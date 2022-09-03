#!/bin/bash

docker run -it -d \
           --name {{docker_elasticsearch_container}} \
           --network {{docker_network_internal}} \
           -e "discovery.type=single-node" \
           -e "bootstrap.memory_lock=true" \
           -e "ELASTIC_PASSWORD={{vault_elasticsearch_password}}" \
           -e "xpack.security.enabled=false" \
           -e "xpack.security.transport.ssl.enabled=false" \
           -v "{{docker_files_path}}/elasticsearch/data:/usr/share/elasticsearch/data" \
           --restart unless-stopped \
           --ulimit nofile=64000:64000 \
           --ulimit nproc=64000:64000 \
           --memory {{docker_elasticsearch_memory}} \
           --cpus 1 \
           --ulimit memlock=-1:-1 \
           {{docker_elasticsearch_image}}
           
           
#-v full_path_to/custom_elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml