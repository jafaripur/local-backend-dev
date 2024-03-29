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
           --memory {{docker_rabbitmq_memory}} \
           --cpus 1 \
           {{docker_rabbitmq_image}}

#rabbitmq stop_app
#rabbitmq reset #force_reset
#rabbitmq start_app