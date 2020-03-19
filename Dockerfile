FROM php:7.3-fpm

RUN apt-get update && apt-get install -y libbz2-dev zip \
                                         libpng-dev libgmp-dev \
                                         libmagickwand-dev zlib1g-dev \
                                         libicu-dev vim net-tools --no-install-recommends

RUN docker-php-ext-install mysqli pdo_mysql \
                           calendar bz2 exif gd \
                           gettext gmp intl shmop \
                           soap sockets sysvmsg sysvsem \
                           sysvshm wddx

RUN pecl install imagick \
	&& docker-php-ext-enable imagick

RUN apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/apt/lists/* 