FROM php:7.4.12-fpm-alpine

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN mkdir -p /var/www/html

RUN docker-php-ext-install pdo pdo_mysql

RUN apk --no-cache add pcre-dev ${PHPIZE_DEPS} \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apk del pcre-dev ${PHPIZE_DEPS}

RUN chown laravel:laravel /var/www/html