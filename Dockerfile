FROM php:8.2-fpm

WORKDIR /var/www

RUN apt-get update && apt-get install -y \
    nginx \
    nodejs \
    npm \
    git \
    curl \
    zip \
    unzip \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY . .

RUN composer install --optimize-autoloader --no-dev
RUN npm install && npm run build

COPY docker/nginx.conf /etc/nginx/sites-enabled/default

RUN chown -R www-data:storage bootstrap/cache

EXPOSE 8080

CMD service nginx start && php-fpm
