#!/bin/bash
nohup /etc/v2ray/v2ray -config /etc/v2ray/config.json
service php7.2-fpm restart
/etc/init.d/caddy start

