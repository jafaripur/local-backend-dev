FROM {{docker_go_image}}

LABEL org.label-schema.name="araz/{{docker_go_image_build}}"

RUN apk update && apk upgrade && echo "UTC" > /etc/timezone \
	&& apk add --no-cache gcc musl-dev \
	&& rm -rf /var/tmp/* /tmp/* /var/cache/apk/*
