#!/bin/sh
  
DEFAULT_PORT="3008"
DEFAULT_HOST="0.0.0.0"

if [ "$1" = "npm" ]; then
	docker run --rm --interactive --tty \
			-v "${PWD}:/home/node/app" \
			-v $HOME/.npm:/.npm \
			-v $HOME/.config:/.config \
			--workdir /home/node/app \
			-p 127.0.0.1:${PORT-$DEFAULT_PORT}:${PORT-$DEFAULT_PORT} \
			-u $(id -u ${USER}):$(id -g ${USER}) \
			-e "NPM_CONFIG_LOGLEVEL=info" \
			-e "HOST=${HOST-$DEFAULT_HOST}" \
			-e "PORT=${PORT-$DEFAULT_PORT}" \
			--log-driver json-file \
			--log-opt max-size=10m \
			--log-opt max-file=5 \
			--memory {{docker_node_memory}} \
			{{docker_node_image_build}} "$@"
elif [ "$1" = "yarn" ]; then
	docker run --rm --interactive --tty \
			-v "${PWD}:/home/node/app" \
			-v $HOME/.npm:/.npm \
			-v $HOME/.config:/.config \
			--workdir /home/node/app \
			-p 127.0.0.1:${PORT-$DEFAULT_PORT}:${PORT-$DEFAULT_PORT} \
			-u $(id -u ${USER}):$(id -g ${USER}) \
			-e "NPM_CONFIG_LOGLEVEL=info" \
			-e "HOST=${HOST-$DEFAULT_HOST}" \
			-e "PORT=${PORT-$DEFAULT_PORT}" \
			--log-driver json-file \
			--log-opt max-size=10m \
			--log-opt max-file=5 \
			--memory {{docker_node_memory}} \
			{{docker_node_image_build}} "$@"
elif [ "$1" = "gulp" ]; then
	docker run --rm --interactive --tty \
			-v "${PWD}:/home/node/app" \
			-v $HOME/.npm:/.npm \
			-v $HOME/.config:/.config \
			--workdir /home/node/app \
			-p 127.0.0.1:${PORT-$DEFAULT_PORT}:${PORT-$DEFAULT_PORT} \
			-u $(id -u ${USER}):$(id -g ${USER}) \
			-e "NPM_CONFIG_LOGLEVEL=info" \
			--log-driver json-file \
			--log-opt max-size=10m \
			--log-opt max-file=5 \
			--memory {{docker_node_memory}} \
			{{docker_node_image_build}} "$@"
else
	docker run --rm --interactive --tty \
			-v "${PWD}:/home/node/app" \
			-v $HOME/.npm:/.npm \
			-v $HOME/.config:/.config \
			--workdir /home/node/app \
			-p 127.0.0.1:${PORT-$DEFAULT_PORT}:${PORT-$DEFAULT_PORT} \
			-u $(id -u ${USER}):$(id -g ${USER}) \
			-e "NPM_CONFIG_LOGLEVEL=info" \
			-e "HOST=${HOST-$DEFAULT_HOST}" \
			-e "PORT=${PORT-$DEFAULT_PORT}" \
			--log-driver json-file \
			--log-opt max-size=10m \
			--log-opt max-file=5 \
			--memory {{docker_node_memory}} \
			{{docker_node_image_build}} node "$@"	
fi