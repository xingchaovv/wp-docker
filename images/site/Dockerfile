FROM php:8.0-fpm-bullseye

# Base packages
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y vim vim-doc
RUN apt-get install -y iputils-ping
RUN apt-get install -y procps
RUN apt-get install -y git
RUN apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev libwebp-dev libzip-dev libmagickwand-dev
RUN apt-get install -y dumb-init

# Install PHP extensions
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install calendar
RUN docker-php-ext-install exif
RUN docker-php-ext-enable opcache
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install sockets
RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp; docker-php-ext-install gd
RUN cd /usr/src; curl -OL https://pecl.php.net/get/imagick-3.7.0.tgz; tar xvf imagick-3.7.0.tgz; cd imagick-3.7.0; phpize; ./configure; make; make install; docker-php-ext-enable imagick
RUN docker-php-ext-install zip
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install intl

# PHP
COPY image-files/php.ini /usr/local/etc/php/php.ini
COPY image-files/php-fpm.conf /usr/local/etc/php-fpm.conf
RUN mv /usr/local/etc/php-fpm.d/docker.conf /usr/local/etc/php-fpm.d/docker.conf.default
RUN mv /usr/local/etc/php-fpm.d/zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf.default
COPY image-files/www.conf /usr/local/etc/php-fpm.d/www.conf

# Install Nginx
RUN apt-get install -y nginx-core=1.18.0-6.1+deb11u3
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.default
COPY image-files/nginx.conf /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
COPY image-files/site.conf /etc/nginx/sites-available/site.conf
RUN ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf

# Entrypoint
COPY image-files/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 80
