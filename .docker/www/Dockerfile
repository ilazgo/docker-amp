ARG PHP_VERSION=7.2
FROM php:${PHP_VERSION}-apache

RUN apt-get update && \
    apt-get install -y \
	git \
	unzip

# Composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# Drush.
ARG DRUSH_VERSION=9
RUN composer global require drush/drush:"${DRUSH_VERSION}" --prefer-dist
ENV PATH /root/.composer/vendor/bin:$PATH