# This file is used in bitbucket pipelines
FROM php:7.2-fpm

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get update && apt-get install -qy curl libxml2-dev unzip gettext zip git zlib1g-dev default-mysql-client locales nodejs python3-pip
RUN docker-php-ext-install soap pdo_mysql bcmath zip intl gettext
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN pip3 install -U awscli
RUN docker-php-ext-configure intl
RUN locale-gen sv_SE.UTF-8 && locale-gen en_US.UTF-8
