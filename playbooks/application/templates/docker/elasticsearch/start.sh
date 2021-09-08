#!/bin/bash

docker run -it -d \
           --name {{docker_elasticsearch_container}} \
           --network {{docker_network_internal}} \
           -e "discovery.type=single-node" \
           -e "ES_JAVA_OPTS=-Xms1g -Xmx1g" \
           -e "bootstrap.memory_lock=true" \
           -v {{docker_files_path}}/elasticsearch/data:/usr/share/elasticsearch/data \
           --restart unless-stopped \
           --log-driver json-file \
           --log-opt max-size=10m \
           --log-opt max-file=5 \
           --ulimit nofile=64000:64000 \
           --ulimit nproc=64000:64000 \
           --memory {{docker_elasticsearch_memory}} \
           --ulimit memlock=-1:-1 \
           --ulimit nofile=64000:64000 \
           {{docker_elasticsearch_image}}
           
           
#-v full_path_to/custom_elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml