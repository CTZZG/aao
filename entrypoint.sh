#!/bin/bash

service php7.2-fpm restart
/etc/init.d/caddy start
/etc/v2ray/v2ray -config /etc/v2ray/config.json
