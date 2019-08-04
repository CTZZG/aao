#!/bin/bash

php-fpm --daemonize --fpm-config /etc/php/7.3/fpm/pool.d/www.conf
sed -i "s/CLIENT_ID/$CLIENT_ID/g" /v2ray/config.json
/v2ray/v2ray &
nginx -g 'daemon off;'
