#!/bin/sh
  
if [ "$1" = "update" ]; then
    docker run --rm --interactive --tty \
	  -v "{{docker_files_path}}/php-cli/data/composer:/tmp" \
	  -v "$PWD:/app" \
	  -u $(id -u ${USER}):$(id -g ${USER}) \
	  composer update --ignore-platform-reqs --no-scripts --optimize-autoloader --classmap-authoritative
elif [ "$1" = "install" ]; then
	docker run --rm --interactive --tty \
	  -v "{{docker_files_path}}/php-cli/data/composer:/tmp" \
	  -v "$PWD:/app" \
	  -u $(id -u ${USER}):$(id -g ${USER}) \
	  composer install --ignore-platform-reqs --no-scripts --optimize-autoloader --classmap-authoritative
else
    docker run --rm --interactive --tty \
	  -v "{{docker_files_path}}/php-cli/data/composer:/tmp" \
	  -v "$PWD:/app" \
	  -u $(id -u ${USER}):$(id -g ${USER}) \
	  composer "$@"
fi