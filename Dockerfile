FROM php:7.4-fpm
WORKDIR /var/www
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libsqlite3-dev \
    zip \
    unzip \
    git
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql pdo_sqlite
COPY . /var/www
RUN chown -R www-data:www-data /var/www
EXPOSE 9000
CMD ["php-fpm"]
 
