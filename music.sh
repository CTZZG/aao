#!/bin/sh
apt-get update
apt-get install -y --no-install-recommends php-fpm php-curl php-cli php-mysql php-readline wget unzip
wget https://install.direct/go.sh
sudo bash go.sh
#wget --no-check-certificate https://raw.githubusercontent.com/renchen1994/v2ray-docker/master/conf/nginx.conf -P /etc/nginx/
#wget --no-check-certificate https://raw.githubusercontent.com/renchen1994/v2ray-docker/master/conf/default.conf -P /etc/nginx/conf.d/
wget -N --no-check-certificate https://raw.githubusercontent.com/renchen1994/aao/Aru-1/conf/config.json -P /etc/v2ray/
wget -N --no-check-certificate https://raw.githubusercontent.com/renchen1994/aao/Aru-1/www.zip && unzip -o www.zip -d /var/www
wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/caddy_install.sh && chmod +x caddy_install.sh && bash caddy_install.sh
wget -N --no-check-certificate https://raw.githubusercontent.com/renchen1994/aao/Aru-1/tls.zip && unzip -o tls.zip
wget -N --no-check-certificate https://raw.githubusercontent.com/renchen1994/aao/Aru-1/conf/www.conf -P /etc/php/7.2/fpm/pool.d/
mv /root/Caddyfile /usr/local/caddy/Caddyfile
systemctl start v2ray
service php7.2-fpm restart
/etc/init.d/caddy start
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
exit 0
iptables -I INPUT -p tcp --dport 443 -j ACCEPT
ip6tables -I INPUT -p tcp --dport 443 -j ACCEPT
sudo apt-get install iptables-persistent
sudo netfilter-persistent save
sudo netfilter-persistent reload
tail -f /tmp/caddy.log
netstat -atnp
