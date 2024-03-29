FROM {{docker_php81fpm_image}}

LABEL org.label-schema.name="araz/{{docker_php81fpm_image_build}}"

RUN apk update && apk upgrade && echo "UTC" > /etc/timezone \
	&& apk add --no-cache autoconf gcc binutils binutils-dev shadow \
	g++ libtool make icu-dev curl-dev openssl-dev libxml2-dev \
	freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev \
	libwebp-dev zlib-dev libxpm-dev gettext-dev libzip-dev rabbitmq-c-dev libssh-dev postgresql-dev \
	imagemagick-dev imagemagick \
	&& pecl install mongodb \
	&& pecl install igbinary \
	&& pecl install amqp \
	&& pecl install msgpack \
	&& pecl install imagick \
	&& docker-php-ext-enable mongodb igbinary amqp msgpack imagick \
	&& docker-php-source extract \
	&& docker-php-ext-configure intl && docker-php-ext-install -j$(nproc) intl \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp && docker-php-ext-install -j$(nproc) gd \
	&& docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
	&& docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
	&& docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
	&& docker-php-ext-install pdo_mysql bcmath gettext opcache zip soap sockets pgsql pdo_pgsql exif \
	&& pecl install --configureoptions 'enable-redis-igbinary="yes" enable-redis-lzf="yes" enable-redis-zstd="yes"' redis \
	&& docker-php-ext-enable --ini-name z-redis.ini redis \
	&& docker-php-source delete \
	&& usermod -u 1000 www-data && groupmod -g 1000 www-data \
	&& apk del shadow bash autoconf gcc binutils binutils-dev g++ libtool make \
	&& rm -rf /var/tmp/* /tmp/* /var/cache/apk/* \
	&& mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
 
#RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

VOLUME ["/var/www/html"]

EXPOSE {{docker_php81fpm_port}}

ENTRYPOINT ["php-fpm", "--nodaemonize"];