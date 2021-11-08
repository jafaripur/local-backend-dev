#!/bin/bash

docker pull {{docker_phpfpm_image}}
docker pull {{docker_phpcli_image}}
docker pull {{docker_mongodb_image}}
docker pull {{docker_nginx_image}}
docker pull {{docker_redis_image}}
docker pull {{docker_elasticsearch_image}}
docker pull {{docker_mysql_image}}
docker pull {{docker_php_myadmin_image}}
docker pull {{docker_node_image}}
docker pull {{docker_rabbitmq_image}}
docker pull {{docker_postgres_image}}
docker pull {{docker_php_pgmyadmin_image}}
docker pull {{docker_go_image}}
docker pull composer:latest
docker pull {{docker_mongo_express_image}}