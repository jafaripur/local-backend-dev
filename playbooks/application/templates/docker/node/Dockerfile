FROM {{docker_node_image}}
#ENV NODE_ENV=production

LABEL org.label-schema.name="araz/{{docker_node_image_build}}"

WORKDIR /home/node/app

RUN npm install --location=global gulp-cli apidoc \
	&& rm -rf /var/tmp/* /tmp/* /var/cache/apk/*
#USER node