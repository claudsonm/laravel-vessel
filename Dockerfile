FROM php:7.4-fpm

LABEL maintainer="Claudson Martins <claudson@outlook.com>"

RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libicu-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure intl && \
    docker-php-ext-install intl pdo_mysql mbstring exif pcntl bcmath gd && \
    pecl install redis && docker-php-ext-enable redis

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
