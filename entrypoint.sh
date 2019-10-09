#!/bin/bash

php-fpm7.2 --daemonize --fpm-config /etc/php/7.2/fpm/pool.d/www.conf
/etc/init.d/caddy start
/etc/v2ray/v2ray

