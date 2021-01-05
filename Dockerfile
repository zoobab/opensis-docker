FROM debian:buster-slim

RUN printf "deb http://deb.debian.org/debian buster-backports main" > /etc/apt/sources.list.d/backports.list

ARG PHP_VERSION=7.3
ARG PHPMYADMIN=4.8.5
ARG RUNPKGS="software-properties-common \
             apt-transport-https \
             vim \
             git \
             apache2 \
             libapache2-mod-fcgid \
             libfcgi-bin \
             mariadb-server \
             mariadb-client \
             php$PHP_VERSION \
             php$PHP_VERSION-cli \
             php$PHP_VERSION-common \
             php$PHP_VERSION-curl \
             php$PHP_VERSION-fpm \
             php$PHP_VERSION-json \
             php$PHP_VERSION-mysql \
             php$PHP_VERSION-opcache \
             php$PHP_VERSION-readline \
             php$PHP_VERSION-xml \
             php$PHP_VERSION-xsl \
             php$PHP_VERSION-gd \
             php$PHP_VERSION-intl \
             php$PHP_VERSION-bz2 \
             php$PHP_VERSION-bcmath \
             php$PHP_VERSION-imap \
             php$PHP_VERSION-gd \
             php$PHP_VERSION-mbstring \
             php$PHP_VERSION-pgsql \
             php$PHP_VERSION-sqlite3 \
             php$PHP_VERSION-xmlrpc \
             php$PHP_VERSION-zip  \
             php$PHP_VERSION-odbc \
             php$PHP_VERSION-snmp \
             php$PHP_VERSION-interbase \
             php$PHP_VERSION-ldap \
             php$PHP_VERSION-tidy \
             php-tcpdf \
             php-redis \
             php-imagick"



COPY ./scripts/docker-entrypoint.sh  ./scripts/build.sql /
RUN apt-get update                         && \
    apt-get --no-install-recommends install -y $RUNPKGS && \
    rm -rf /var/lib/apt/lists/* &&  \
    echo $PHP_VERSION > /PHP_VERSION && \
    git  clone --recursive https://github.com/OS4ED/openSIS-Responsive-Design.git /var/www/html/opensis && \
    chown -R www-data.www-data /var/www/html/opensis && \
    a2enmod proxy_fcgi setenvif && \
    a2enconf php$PHP_VERSION-fpm  && \
    apt-get -y remove git && \
    apt-get -y autoremove && \
    apt-get -y clean 



ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80
