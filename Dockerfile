FROM php:8.1-fpm-alpine3.17

# Install usermod and usermod www-data
RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories
RUN apk add --no-cache shadow
RUN usermod -u 1000 www-data

# Install PostgreSQL
RUN apk add --no-cache postgresql-dev
RUN docker-php-ext-install pdo pdo_pgsql

# Install opcache
RUN docker-php-ext-install opcache

# Install intl extension
RUN docker-php-ext-install intl

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer self-update --2