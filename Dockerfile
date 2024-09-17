FROM php:8.3-fpm

# Set working directory
WORKDIR /var/www/partir

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    unzip \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql mbstring exif pcntl bcmath gd

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Copy existing application directory contents
COPY . .

# Install any needed packages
RUN composer install --no-dev --prefer-dist

# Change current user to www-data
USER partir 

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]