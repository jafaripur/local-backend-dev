#!/bin/bash

{% if docker_php7fpm_image is defined %}
docker pull {{docker_php7fpm_image}}
{% endif %}
{% if docker_php7cli_image is defined %}
docker pull {{docker_php7cli_image}}
{% endif %}
{% if docker_php8fpm_image is defined %}
docker pull {{docker_php8fpm_image}}
{% endif %}
{% if docker_php8cli_image is defined %}
docker pull {{docker_php8cli_image}}
{% endif %}
{% if docker_php81fpm_image is defined %}
docker pull {{docker_php81fpm_image}}
{% endif %}
{% if docker_php81cli_image is defined %}
docker pull {{docker_php81cli_image}}
{% endif %}
{% if docker_nginx_image is defined %}
docker pull {{docker_nginx_image}}
{% endif %}
{% if docker_mongodb_image is defined %}
docker pull {{docker_mongodb_image}}
{% endif %}
{% if docker_redis_image is defined %}
docker pull {{docker_redis_image}}
{% endif %}
{% if docker_elasticsearch_image is defined %}
docker pull {{docker_elasticsearch_image}}
{% endif %}
{% if docker_mysql_image is defined %}
docker pull {{docker_mysql_image}}
{% endif %}
{% if docker_php_myadmin_image is defined %}
docker pull {{docker_php_myadmin_image}}
{% endif %}
{% if docker_node_image is defined %}
docker pull {{docker_node_image}}
{% endif %}
{% if docker_rabbitmq_image is defined %}
docker pull {{docker_rabbitmq_image}}
{% endif %}
{% if docker_postgres_image is defined %}
docker pull {{docker_postgres_image}}
{% endif %}
{% if docker_php_pgmyadmin_image is defined %}
docker pull {{docker_php_pgmyadmin_image}}
{% endif %}
{% if docker_go_image is defined %}
docker pull {{docker_go_image}}
{% endif %}
{% if docker_composer_image is defined %}
docker pull {{docker_composer_image}}
{% endif %}
{% if docker_mongo_express_image is defined %}
docker pull {{docker_mongo_express_image}}
{% endif %}