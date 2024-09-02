FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    libpq-dev

RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install pdo pdo_pgsql gd

WORKDIR /var/www/html

COPY . .

RUN chown -R www-data:www-data /var/www/html/storage

CMD ["php-fpm"]
