FROM php:8.2-cli

RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip \
    zip \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libsodium-dev \
    libpq-dev \
    default-mysql-client \
    default-libmysqlclient-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_pgsql pdo_mysql mbstring exif pcntl bcmath gd zip sodium

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash && \
    apt-get update && apt-get install -y nodejs

WORKDIR /var/www/html

COPY . .

# ⛔ JANGAN EXPOSE PORT STATIS
# EXPOSE 8000  ❌ HAPUS

RUN composer install --no-dev --optimize-autoloader
RUN npm install && npm run build || true

RUN chmod -R 777 storage bootstrap/cache

CMD php artisan migrate --force \
 && php artisan config:clear \
 && php artisan route:clear \
 && php artisan view:clear \
 && php -S 0.0.0.0:$PORT -t public
