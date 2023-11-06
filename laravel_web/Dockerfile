FROM php:8.2-fpm

ARG USER_ID

# Install dependencies
RUN apt update && apt install -y \
    build-essential \
    libwebp-dev \
    libxpm-dev \
    libonig-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    libzip-dev \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \   
    unzip \
    git \
    curl

# Clear cache
RUN apt clean && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
RUN docker-php-ext-configure gd \
            --prefix=/usr \
            --with-jpeg \
            --with-webp \
            --with-xpm \
            --with-freetype

RUN docker-php-ext-install gd

RUN pecl install redis && docker-php-ext-enable redis

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add user for laravel application
RUN groupadd -g ${USER_ID} www
RUN useradd -u ${USER_ID} -ms /bin/bash -g www www

RUN chown www:www /var/www

# Change current user to www
USER www

# Set working directory
WORKDIR /var/www

# Expose port 9000 and start php-fpm server
EXPOSE 9000

CMD ["./run.sh"]
