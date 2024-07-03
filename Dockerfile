FROM php:8.3-apache

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN apt-get update 

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash && apt install symfony-cli -y

RUN apt-get install -y \
    git \
    gettext \
    nano \
    wget \
    unzip \
    libzip-dev

RUN   docker-php-ext-install zip

RUN   docker-php-ext-install gettext

RUN install-php-extensions xdebug redis

EXPOSE 80 8000 443