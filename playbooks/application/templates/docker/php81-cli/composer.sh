#!/bin/sh
  
if [ "$1" = "update" ]; then
    docker run --rm --init --interactive --tty \
	  -v {{docker_files_path}}/php81-cli/config/php-custom.ini:/usr/local/etc/php/conf.d/99-php-custom.ini:ro \
	  -v "{{docker_files_path}}/php81-cli/composer:/.composer" \
	  -v "$PWD:/var/www/html" \
	  --workdir "/var/www/html/" \
	  -u $(id -u ${USER}):$(id -g ${USER}) \
	  {{docker_php81cli_image_build}}:latest composer update --optimize-autoloader --classmap-authoritative
elif [ "$1" = "install" ]; then
	docker run --rm --init --interactive --tty \
	  -v {{docker_files_path}}/php81-cli/config/php-custom.ini:/usr/local/etc/php/conf.d/99-php-custom.ini:ro \
	  -v "{{docker_files_path}}/php81-cli/composer:/.composer" \
	  -v "$PWD:/var/www/html" \
	  --workdir "/var/www/html/" \
	  -u $(id -u ${USER}):$(id -g ${USER}) \
	  {{docker_php81cli_image_build}}:latest composer install --optimize-autoloader --classmap-authoritative
else
    docker run --rm  --init --interactive --tty \
	  -v {{docker_files_path}}/php81-cli/config/php-custom.ini:/usr/local/etc/php/conf.d/99-php-custom.ini:ro \
	  -v "{{docker_files_path}}/php81-cli/composer:/.composer" \
	  -v "$PWD:/var/www/html" \
	  --workdir "/var/www/html/" \
	  -u $(id -u ${USER}):$(id -g ${USER}) \
	  {{docker_php81cli_image_build}}:latest composer "$@"
fi