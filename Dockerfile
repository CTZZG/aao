FROM ubuntu:18.04

#ENV CLIENT_ID
#ENV CLIENT_ALTERID 64
#ENV CLIENT_SECURITY aes-128-gcm
ENV VER=4.20.0

RUN apt-get update \
	&& apt-get install -y --no-install-recommends php-fpm php-curl php-cli php-mysql php-readline wget unzip apt-utils \
	&& mkdir -m 777 /etc/v2ray \
	&& wget -N --no-check-certificate https://raw.githubusercontent.com/renchen1994/aao/Aru-1/conf/config.json -P /etc/v2ray/ \
	&& wget -N --no-check-certificate https://raw.githubusercontent.com/renchen1994/aao/Aru-1/www.zip && unzip -o www.zip -d /var/www \
	&& wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/caddy_install.sh && chmod +x caddy_install.sh && bash caddy_install.sh \
	&& wget -N --no-check-certificate https://raw.githubusercontent.com/renchen1994/aao/Aru-1/conf/www.conf -P /etc/php/7.2/fpm/pool.d/ \
	&& wget -N --no-check-certificate https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip \
	&& unzip v2ray-linux-64.zip \
	&& cp -f v2ray v2ctl geoip.dat geosite.dat /etc/v2ray \	
	&& chmod +x /etc/v2ray/v2ray v2ctl \
	&& rm -rf doc  geoip.dat  geosite.dat systemd  systemv  v2ctl  v2ctl.sig  v2ray  v2ray-linux-64.zip  v2ray.sig  vpoint_socks_vmess.json  vpoint_vmess_freedom.json config.json \
ADD conf/v2ray.service /etc/v2ray/v2ray.service
ADD conf/Caddyfile /usr/local/caddy/Caddyfile
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT  /entrypoint.sh

EXPOSE 80
