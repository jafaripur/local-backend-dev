FROM {{docker_php7cli_image}}

LABEL org.label-schema.name="araz/{{docker_php7cli_image_build}}"

RUN apk update && apk upgrade && echo "UTC" > /etc/timezone \
	&& apk add --no-cache autoconf gcc binutils binutils-dev \
	g++ libtool make icu-dev curl-dev openssl-dev libxml2-dev \
	freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev \
	libwebp-dev zlib-dev libxpm-dev gettext-dev libzip-dev rabbitmq-c-dev libssh-dev postgresql-dev \
	&& pecl install mongodb \
	&& pecl install igbinary \
	&& pecl install amqp \
	&& pecl install msgpack \
	&& docker-php-ext-enable mongodb igbinary amqp msgpack \
	&& docker-php-source extract \
	&& docker-php-ext-configure intl && docker-php-ext-install -j$(nproc) intl \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg && docker-php-ext-install -j$(nproc) gd \
	&& docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
	&& docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
	&& docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
	&& docker-php-ext-install pdo_mysql bcmath gettext pcntl opcache zip soap sockets pgsql pdo_pgsql \
	&& docker-php-source delete \
	&& apk del bash autoconf gcc binutils binutils-dev g++ libtool make \
	&& rm -rf /var/tmp/* /tmp/* /var/cache/apk/* \
	&& mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

#RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

VOLUME ["/var/www/html", "/usr/local/etc/php/conf.d"]

#ENTRYPOINT ["php", "-a"]
CMD ["php", "-a"]