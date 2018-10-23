FROM php:7.2

RUN apt-get update && apt-get install -y \
    unzip \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libicu-dev \
    libxslt-dev \
    libzip-dev \
    curl \
    build-essential \
    libxml2-dev \
    git-core

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && docker-php-ext-install gd
RUN docker-php-ext-install intl
RUN docker-php-ext-install xsl
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install soap
RUN docker-php-ext-install bcmath

RUN curl --silent --show-error https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer