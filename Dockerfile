# This file is used in bitbucket pipelines
FROM php:8.0-fpm

RUN apt-get update && apt-get install -qy curl libxml2-dev unzip gettext zip git libzip-dev default-mysql-client locales python3-pip libjpeg-dev libwebp-dev libpng-dev

RUN docker-php-ext-configure gd --with-jpeg --with-webp
RUN docker-php-ext-install soap pdo_mysql bcmath zip intl gettext gd

RUN echo 'max_execution_time = 90' >> $PHP_INI_DIR/conf.d/php.ini
RUN echo 'memory_limit = 512M' >> $PHP_INI_DIR/conf.d/php.ini
RUN echo 'date.timezone = "Europe/Stockholm"' >> $PHP_INI_DIR/conf.d/php.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -qy nodejs
RUN npm install -g aws-cdk
RUN pip3 install -U awscli

RUN rm -rf /var/lib/apt/lists/*

RUN locale-gen sv_SE.UTF-8 && locale-gen en_US.UTF-8
