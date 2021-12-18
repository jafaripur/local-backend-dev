#!/bin/sh
  
if [ "$1" = "update" ]; then
    docker run --rm --interactive --tty \
	  -v "{{docker_files_path}}/php-composer/data:/tmp" \
	  -v "$PWD:/app" \
	  -u $(id -u ${USER}):$(id -g ${USER}) \
	  {{docker_composer_image}} update --ignore-platform-reqs --no-scripts --optimize-autoloader --classmap-authoritative
elif [ "$1" = "install" ]; then
	docker run --rm --interactive --tty \
	  -v "{{docker_files_path}}/php-composer/data:/tmp" \
	  -v "$PWD:/app" \
	  -u $(id -u ${USER}):$(id -g ${USER}) \
	  {{docker_composer_image}} install --ignore-platform-reqs --no-scripts --optimize-autoloader --classmap-authoritative
else
    docker run --rm --interactive --tty \
	  -v "{{docker_files_path}}/php-composer/data:/tmp" \
	  -v "$PWD:/app" \
	  -u $(id -u ${USER}):$(id -g ${USER}) \
	  {{docker_composer_image}} "$@"
fi