#!/bin/bash
sudo wget -N --no-check-certificate https://install.direct/go.sh && chmod +x go.sh && bash go.sh
sudo wget -N --no-check-certificate https://raw.githubusercontent.com/renchen1994/aao/Aru-1/conf/config.json -P /etc/v2ray/
sudo systemctl start v2ray
sudo service php7.2-fpm restart
/etc/init.d/caddy start
