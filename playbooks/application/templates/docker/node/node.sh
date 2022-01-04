#!/bin/sh
  
DEFAULT_PORT="3008"
DEFAULT_HOST="0.0.0.0"

if [ "$1" = "npm" ]; then
	docker run --rm --init --interactive --tty \
			-v "${PWD}:/home/node/app" \
			-v "{{docker_files_path}}/node/data/npm:/.npm" \
			-v "{{docker_files_path}}/node/data/config:/.config" \
			--workdir /home/node/app \
			-p 127.0.0.1:${PORT-$DEFAULT_PORT}:${PORT-$DEFAULT_PORT} \
			-u $(id -u ${USER}):$(id -g ${USER}) \
			-e "NPM_CONFIG_LOGLEVEL=info" \
			-e "HOST=${HOST-$DEFAULT_HOST}" \
			-e "PORT=${PORT-$DEFAULT_PORT}" \
			--memory {{docker_node_memory}} \
			{{docker_node_image_build}} "$@"
elif [ "$1" = "yarn" ]; then
	docker run --rm --init --interactive --tty \
			-v "${PWD}:/home/node/app" \
			-v "{{docker_files_path}}/node/data/npm:/.npm" \
			-v "{{docker_files_path}}/node/data/config:/.config" \
			--workdir /home/node/app \
			-p 127.0.0.1:${PORT-$DEFAULT_PORT}:${PORT-$DEFAULT_PORT} \
			-u $(id -u ${USER}):$(id -g ${USER}) \
			-e "NPM_CONFIG_LOGLEVEL=info" \
			-e "HOST=${HOST-$DEFAULT_HOST}" \
			-e "PORT=${PORT-$DEFAULT_PORT}" \
			--memory {{docker_node_memory}} \
			{{docker_node_image_build}} "$@"
elif [ "$1" = "gulp" ]; then
	docker run --rm --init --interactive --tty \
			-v "${PWD}:/home/node/app" \
			-v "{{docker_files_path}}/node/data/npm:/.npm" \
			-v "{{docker_files_path}}/node/data/config:/.config" \
			--workdir /home/node/app \
			-p 127.0.0.1:${PORT-$DEFAULT_PORT}:${PORT-$DEFAULT_PORT} \
			-u $(id -u ${USER}):$(id -g ${USER}) \
			-e "NPM_CONFIG_LOGLEVEL=info" \
			--memory {{docker_node_memory}} \
			{{docker_node_image_build}} "$@"
elif [ "$1" = "apidoc" ]; then
	docker run --rm --init --interactive --tty \
			-v "${PWD}:/home/node/app" \
			-v "{{docker_files_path}}/node/data/npm:/.npm" \
			-v "{{docker_files_path}}/node/data/config:/.config" \
			--workdir /home/node/app \
			-u $(id -u ${USER}):$(id -g ${USER}) \
			-e "NPM_CONFIG_LOGLEVEL=info" \
			--memory {{docker_node_memory}} \
			{{docker_node_image_build}} "$@"
else
	docker run --rm --init --interactive --tty \
			-v "${PWD}:/home/node/app" \
			-v "{{docker_files_path}}/node/data/npm:/.npm" \
			-v "{{docker_files_path}}/node/data/config:/.config" \
			--workdir /home/node/app \
			-p 127.0.0.1:${PORT-$DEFAULT_PORT}:${PORT-$DEFAULT_PORT} \
			-u $(id -u ${USER}):$(id -g ${USER}) \
			-e "NPM_CONFIG_LOGLEVEL=info" \
			-e "HOST=${HOST-$DEFAULT_HOST}" \
			-e "PORT=${PORT-$DEFAULT_PORT}" \
			--memory {{docker_node_memory}} \
			{{docker_node_image_build}} node "$@"	
fi