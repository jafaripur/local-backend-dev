FROM {{docker_node_image}}
#ENV NODE_ENV=production

LABEL maintainer="mjafaripr@yahoo.com"

LABEL org.label-schema.name="araz/{{docker_node_image_build}}"

WORKDIR /home/node/app

RUN npm install --global gulp-cli \
	&& rm -rf /var/tmp/* /tmp/* /var/cache/apk/*
#USER node