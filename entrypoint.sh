#!/bin/bash
wget -N --no-check-certificate https://install.direct/go.sh && chmod +x go.sh && bash go.sh
wget -N --no-check-certificate https://raw.githubusercontent.com/renchen1994/aao/Aru-1/conf/config.json -P /etc/v2ray/
service start v2ray
service php7.2-fpm restart
/etc/init.d/caddy start

