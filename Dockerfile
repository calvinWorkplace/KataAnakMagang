FROM php:8.2-apache

# FORCE disable all MPM first
RUN rm -f /etc/apache2/mods-enabled/mpm_*.load \
 && rm -f /etc/apache2/mods-enabled/mpm_*.conf

# Enable ONLY prefork + rewrite
RUN a2enmod mpm_prefork rewrite

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Laravel public folder
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' \
    /etc/apache2/sites-available/*.conf \
    /etc/apache2/apache2.conf

# Copy app
COPY . /var/www/html
WORKDIR /var/www/html

# Permissions
RUN chown -R www-data:www-data storage bootstrap/cache

EXPOSE 80
