ARG PHP_VERSION=7.2
FROM php:${PHP_VERSION}-apache

RUN apt-get update && \
    apt-get install -y \
	git \
	unzip \
	default-mysql-client \
	libpng-dev \
	libldap2-dev \
	libxml2-dev \
	memcached libmemcached-dev zlib1g-dev libicu-dev

RUN git clone -b php7 https://github.com/php-memcached-dev/php-memcached /usr/src/php/ext/memcached

RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/
RUN docker-php-ext-configure /usr/src/php/ext/memcached --disable-memcached-sasl

RUN docker-php-ext-install \
	gd \
	ldap \
	opcache \
	mysqli \
	soap \
	xmlrpc \
	/usr/src/php/ext/memcached

RUN rm -rf /var/lib/apt/lists/* && \
	rm -rf /usr/src/php/ext/memcached

# Composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# Drush.
ARG DRUSH_VERSION=9
RUN composer global require drush/drush:"${DRUSH_VERSION}" --prefer-dist
ENV PATH /root/.composer/vendor/bin:$PATH
