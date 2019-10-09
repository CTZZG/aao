#!/bin/bash
sudo systemctl start v2ray
sudo service php7.2-fpm restart
/etc/init.d/caddy start
