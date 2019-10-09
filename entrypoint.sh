#!/bin/bash
systemctl enable /etc/v2ray/systemd/v2ray.service
systemctl start v2ray
service php7.2-fpm restart
/etc/init.d/caddy start
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
