FROM php:8.3-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev \
    git \
    curl \
    zip \
    unzip

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_pgsql

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

# Install production dependencies
WORKDIR /var/www/html
COPY package*.json ./
RUN npm install --production

# Set working directory
WORKDIR /var/www/html

# Copy existing application directory contents
COPY . /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html/storage

# Install dependencies
RUN composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader

# Run php-fpm
CMD ["php-fpm"]