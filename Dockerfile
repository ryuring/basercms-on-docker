FROM php:7.0.25-apache-jessie

ARG version="4.0.9"

RUN apt-get update \
    && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        openssl libssl-dev \
        libxml2-dev \
        unzip \
        git \
    && docker-php-ext-install -j$(nproc) iconv mcrypt pdo_mysql mbstring xml tokenizer zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-enable opcache \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& cd /etc/apache2/mods-enabled \
    && ln -s ../mods-available/rewrite.load \
    && curl -o /var/www/basercms-${version}.zip https://basercms.net/packages/download/basercms/${version} \
    && unzip /var/www/basercms-${version}.zip -d /var/www \
    && rm -rf /var/www/html \
    && ln -s /var/www/basercms /var/www/html \
    && chmod go+w /var/www/basercms/app/Config \
    && chmod go+w /var/www/basercms/app/Plugin \
    && chmod go+w /var/www/basercms/app/tmp \
    && chmod go+w /var/www/basercms/app/View/Pages \
    && chmod go+w /var/www/basercms/files \
    && chmod go+w /var/www/basercms/theme \
    && chmod go+w /var/www/basercms/img \
    && chmod go+w /var/www/basercms/css \
    && chmod go+w /var/www/basercms/js \
    && chmod go+w /var/www/basercms/app/db
