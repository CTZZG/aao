#!/bin/sh
apt-get update
apt-get install -y --no-install-recommends php-fpm php-curl php-cli php-mysql php-readline wget unzip
mkdir -m 777 /etc/v2ray
wget -N --no-check-certificate https://raw.githubusercontent.com/renchen1994/aao/Aru-1/conf/config.json -P /etc/v2ray/
wget -N --no-check-certificate https://raw.githubusercontent.com/renchen1994/aao/Aru-1/www.zip && unzip -o www.zip -d /var/www
wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/caddy_install.sh && chmod +x caddy_install.sh && bash caddy_install.sh
wget -N --no-check-certificate https://raw.githubusercontent.com/renchen1994/aao/Aru-1/tls.zip && unzip -o tls.zip
wget -N --no-check-certificate https://raw.githubusercontent.com/renchen1994/aao/Aru-1/conf/www.conf -P /etc/php/7.2/fpm/pool.d/
mv /root/Caddyfile /usr/local/caddy/Caddyfile
mv /root/v2ray.service /etc/v2ray/v2ray.service
systemctl enable /etc/v2ray/v2ray.service
read -p "请输入版本号:" VER
echo "版本号为：$VER"
wget https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip
unzip -o v2ray-linux-64.zip
cp -f v2ray v2ctl geoip.dat geosite.dat /etc/v2ray
chmod +x /etc/v2ray/v2ray v2ctl
systemctl start v2ray
rm -rf doc  geoip.dat  geosite.dat systemd  systemv  v2ctl  v2ctl.sig  v2ray  v2ray-linux-64.zip  v2ray.sig  vpoint_socks_vmess.json  vpoint_vmess_freedom.json config.json
echo "v2ray更新成功"
service php7.2-fpm restart
/etc/init.d/caddy start
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
exit 0
iptables -I INPUT -p tcp --dport 443 -j ACCEPT
sudo apt-get install iptables-persistent
sudo netfilter-persistent save
sudo netfilter-persistent reload
