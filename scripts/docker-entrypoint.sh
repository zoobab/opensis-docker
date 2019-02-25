#!/bin/bash

#DECLARE/SET VARIABLES
PHPVERSION=`cat /PHP_VERSION 2>/dev/null`
if [ -z "$PHPVERSION" ]; then
    PHPVERSION=`php -v|grep --only-matching --perl-regexp "7\.\\d+" |head -n1`
fi

if [ -z "$PHPVERSION" ]; then
    PHPVERSION='7.3'
fi

echo > /etc/php/$PHPVERSION/fpm/env.conf
for i in `/usr/bin/env`; do
    PARAM=`echo $i |cut -d"=" -f1`
    VAL=`echo $i |cut -d"=" -f2`
    echo "env[$PARAM]=\"$VAL\"" >> /etc/php/$PHPVERSION/fpm/env.conf
done

#PUPULATE TEMPLATES

$(which sed) -i 's/%PHP_VERSION%/'$PHPVERSION'/g' /etc/php/$PHPVERSION/fpm/pool.d/www.conf
$(which sed) -i 's/%PHP_VERSION%/'$PHPVERSION'/g' /etc/php/$PHPVERSION/fpm/php-fpm.conf


#START SERVICES
/etc/init.d/php$PHPVERSION-fpm start
/etc/init.d/mysql start
/etc/init.d/apache2 start

#Create mariadb user
mysql < /build.sql

#KEEP CONTAINER ALIVE
/usr/bin/tail -f /var/log/apache2/access.log
