#!/bin/bash

docker run -it -d \
           --name {{docker_mongo_express_container}} \
           --network {{docker_network_internal}} \
           -p 127.0.0.1:{{docker_mongo_express_external_port}}:8081 \
           -e ME_CONFIG_OPTIONS_EDITORTHEME="ambiance" \
           -e ME_CONFIG_BASICAUTH_USERNAME="" \
           -e ME_CONFIG_MONGODB_URL="mongodb://root:{{vault_mongodb_root_password | urlencode}}@{{docker_mongodb_container}}:27017?authSource=admin" \
           --restart unless-stopped \
           --log-driver json-file \
           --log-opt max-size=10m \
           --log-opt max-file=5 \
           --memory {{docker_mongo_express_container_memory}} \
           {{docker_mongo_express_image}}