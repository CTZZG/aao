#!/bin/bash

php-fpm7.2 --daemonize --fpm-config /etc/php/7.2/fpm/pool.d/www.conf
sed -i "s/CLIENT_ID/$CLIENT_ID/g" /etc/v2ray/config.json
nohup /etc/caddy/caddy -log stdout -log-timestamps=false -agree=true -conf=/etc/caddy/Caddyfile -root=/var/tmp &
/etc/v2ray/v2ray

