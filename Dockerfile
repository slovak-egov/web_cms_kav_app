###   Composer            ###
# Install dependencies by composer
FROM php:8.2.8-apache-bullseye AS composer

USER root
WORKDIR /app

# prepare composer env (allow-url-open)
COPY composer/php.ini /usr/local/etc/php/conf.d/composer-allow-url.ini
COPY composer.json composer.lock /app/
COPY scripts /app/scripts/
COPY patches/ /app/patches/

ENV COMPOSER_HOME=/app
ENV COMPOSER_MAX_PARALLEL_HTTP=50
ENV COMPOSER_NO_DEV=1
ENV COMPOSER_CACHE_DIR=/tmp

RUN set -eux; \
    if command -v a2enmod; \
    then a2enmod rewrite; \
    fi; \
    \
    savedAptMark="$(apt-mark showmanual)"; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
     git \
     libfreetype6-dev \
     libjpeg-dev \
     libpng-dev \
     libpq-dev \
     libwebp-dev \
     libzip-dev \
     p7zip; \
     \
     docker-php-ext-configure gd --with-freetype --with-jpeg=/usr --with-webp; \
     docker-php-ext-install -j "$(nproc)" gd opcache pdo_mysql pdo_pgsql zip; \
     \
     rm -rf /var/lib/apt/lists/*

RUN echo $(which git) && git --version

RUN { echo 'opcache.memory_consumption=128'; echo 'opcache.interned_strings_buffer=8'; echo 'opcache.max_accelerated_files=4000'; echo 'opcache.revalidate_freq=60'; } > /usr/local/etc/php/conf.d/opcache-recommended.ini

RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/bin --filename=composer && chmod a+x /usr/bin/composer; \
    chown www-data:www-data -R /app; \
    runuser -u www-data -- /usr/bin/composer install --optimize-autoloader;

###   cms.slovensko.sk   ###
# Build final image
FROM php:8.2.8-apache-bullseye
ARG CMS_VERSION

USER root

ENV CMS_VERSION=$CMS_VERSION

RUN set -eux; \
		APT_MARK="$(apt-mark showmanual)"; \
		\
		DEBIAN_FRONTEND=noninteractive; \
		apt-get update; \
		apt-get upgrade -y; \
		apt-get install -y --no-install-recommends \
			libfreetype6-dev \
			libicu-dev \
			libjpeg-dev \
			libpng-dev \
			libpq-dev \
			libwebp-dev \
			libxml2-dev \
			libzip-dev \
			postgresql-client \
			unzip \
			iproute2 \
			tcpdump \
		; \
		\
		docker-php-ext-configure intl; \
		docker-php-ext-configure gd \
			--with-freetype \
			--with-jpeg=/usr \
			--with-webp \
		; \
		\
		docker-php-ext-install -j "$(nproc)" \
			gd \
			intl \
			opcache \
			# pdo_mysql \
			pdo_pgsql \
			soap \
			sockets \
			zip \
		; \
		\
		pecl install redis; \
		docker-php-ext-enable redis; \
		\
		# reset apt-mark's "manual" list so that "purge --auto-remove" will remove all build dependencies
		apt-mark auto '.*' > /dev/null; \
		apt-mark manual ${APT_MARK}; \
		ldd "$(php -r 'echo ini_get("extension_dir");')"/*.so \
			| awk '/=>/ { print $3 }' \
			| sort -u \
			| xargs -r dpkg-query -S \
			| cut -d: -f1 \
			| sort -u \
			| xargs -rt apt-mark manual; \
		\
		apt-mark auto gcc g++ dpkg-dev libc6-dev make pkg-config; \
		apt-mark manual \
			bzip2 \
			patch \
			postgresql-client \
			unzip \
		; \
		\
		apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
		rm -rf /var/lib/apt/lists/*; \
		\
		docker-php-source delete; \
		rm -rf /tmp/pear

# prepare Apache & PHP configuration
COPY docker/apache/app.conf /etc/apache2/sites-available/000-app.conf
COPY docker/apache/mpm_prefork.conf /etc/apache2/mods-enabled/mpm_prefork.conf
COPY docker/php/app.ini /usr/local/etc/php/conf.d/app.ini

RUN a2ensite 000-app.conf; \
		a2dissite 000-default.conf; \
		a2enmod rewrite; \
		\
		ln -sf /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini; \
		\
		mkdir -p /app/web/; \
		chown -R www-data:www-data /app

USER www-data

RUN . "$APACHE_ENVVARS"; \
		ln -sfT /dev/null "$APACHE_LOG_DIR/access.log"; \
		ln -sfT /dev/null "$APACHE_LOG_DIR/other_vhosts_access.log"

WORKDIR /app

COPY docker/app/php.ini /usr/local/etc/php/conf.d/drupal.ini

# Required BootstrapHook.php
COPY --chown=www-data:www-data composer.json /app/

# Copy dependencies from Composer
COPY --chown=www-data:www-data --from=composer /app/vendor /app/vendor
COPY --chown=www-data:www-data --from=composer /app/web /app/web

# Copy from git
COPY --chown=www-data:www-data config /app/config/
COPY --chown=www-data:www-data translations /app/translations/
COPY --chown=www-data:www-data web /app/web/
COPY --chown=www-data:www-data load.environment.php /app

COPY entrypoint /usr/local/bin/entrypoint

ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD ["apache2-foreground"]
