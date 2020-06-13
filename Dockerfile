FROM php:latest

ARG VCS_REF
ARG BUILD_DATE
ARG BUILD_VERSION

LABEL maintainer="Davi Marcondes Moreira <davi.marcondes.moreira@gmail.com>" \
      org.label-schema.name="DevDrops/PHP-Toolbox" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/devdrops/php-toolbox" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.version=$BUILD_VERSION

RUN curl --silent https://getcomposer.org/installer | php > /dev/null 2>&1 && \
    mv ./composer.phar /usr/local/bin/composer > /dev/null 2>&1

RUN apt-get update > /dev/null 2>&1 && \
    apt-get -y install \
        git \
        zip \
        unzip \
        zlib1g-dev \
        libzip-dev > /dev/null 2>&1 && \
    apt-get clean && \
    docker-php-ext-install zip && \
    rm -rf /var/lib/apt/lists/* > /dev/null 2>&1

RUN composer global require \
        phpunit/phpunit \
        squizlabs/php_codesniffer \
        friendsofphp/php-cs-fixer \
        phpmd/phpmd \
        behat/behat \
        phploc/phploc \
        phpstan/phpstan \
        icanhazstring/composer-unused \
        vimeo/psalm > /dev/null 2>&1

RUN ln -s -f /root/.composer/vendor/bin/* /usr/local/bin/ > /dev/null 2>&1
