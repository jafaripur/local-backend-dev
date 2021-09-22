#!/bin/bash

docker run -it -d \
           --name {{docker_rabbitmq_container}} \
           --hostname {{system_hostname}} \
           --network {{docker_network_internal}} \
           -p 127.0.0.1:15672:15672 \
           -v "{{docker_files_path}}/rabbitmq/config/rabbitmq.conf:/etc/rabbitmq/rabbitmq.conf:ro" \
           -v "{{docker_files_path}}/rabbitmq/data/lib:/var/lib/rabbitmq/mnesia" \
           -v "{{docker_files_path}}/rabbitmq/data/log:/var/log/rabbitmq" \
           -v "{{docker_files_path}}/rabbitmq/config/enabled_plugins:/etc/rabbitmq/enabled_plugins:ro" \
           --restart unless-stopped \
           --log-driver json-file \
           --log-opt max-size=10m \
           --log-opt max-file=5 \
           --memory {{docker_rabbitmq_memory}} \
           {{docker_rabbitmq_image}}

#rabbitmq stop_app
#rabbitmq reset #force_reset
#rabbitmq start_app