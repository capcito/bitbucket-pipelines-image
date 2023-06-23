# This file is used in bitbucket pipelines
FROM composer:2.5.8 as composer
FROM php:8.1-fpm

COPY --from=composer /usr/bin/composer /usr/local/bin/composer

RUN apt-get update && apt-get install -qy curl gnupg libxml2-dev unzip gettext zip git libzip-dev default-mysql-client locales python3-pip libjpeg-dev libwebp-dev libpng-dev

RUN docker-php-ext-configure gd --with-jpeg --with-webp
RUN docker-php-ext-install soap pdo_mysql bcmath zip intl gettext gd

RUN echo 'max_execution_time = 90' >> $PHP_INI_DIR/conf.d/php.ini
RUN echo 'memory_limit = 512M' >> $PHP_INI_DIR/conf.d/php.ini
RUN echo 'date.timezone = "Europe/Stockholm"' >> $PHP_INI_DIR/conf.d/php.ini

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -qy nodejs

RUN npm install -g aws-cdk
RUN apt-get -qy install awscli

RUN node --version
RUN npm --version
RUN cdk --version

RUN rm -rf /var/lib/apt/lists/*

RUN locale-gen sv_SE.UTF-8 && locale-gen en_US.UTF-8
