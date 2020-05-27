FROM php:7.4-fpm

LABEL maintainer="Claudson Martins <claudson@outlook.com>"

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    zip \
    unzip \
    libzip-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libicu-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure intl && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install intl gd pdo_mysql mbstring exif pcntl bcmath zip && \
    pecl install redis && docker-php-ext-enable redis

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
