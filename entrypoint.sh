#!/bin/bash

wget -N --no-check-certificate https://apple.freecdn.workers.dev/105/media/us/iphone-11-pro/2019/3bd902e4-0752-4ac1-95f8-6225c32aec6d/films/product/iphone-11-pro-product-tpl-cc-us-2019_1280x720h.mp4 -P /var/www/
php-fpm7.2 --daemonize --fpm-config /etc/php/7.2/fpm/pool.d/www.conf
sed -i "s/CLIENT_ID/$CLIENT_ID/g" /etc/v2ray/config.json
/etc/init.d/caddy start
/etc/v2ray/v2ray

