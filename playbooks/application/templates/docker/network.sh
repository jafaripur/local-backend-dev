#!/bin/bash

{% if docker_network_internal is defined %}
docker network create --driver overlay --attachable {{docker_network_internal}}
{% endif %}
{% if docker_network_external is defined %}
docker network create --driver overlay --attachable {{docker_network_external}}
{% endif %}