#!/bin/bash

systemctl start v2ray
service php7.2-fpm restart
/etc/init.d/caddy start
