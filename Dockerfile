FROM ubuntu:18.04

ENV CLIENT_ID 808aa6e3-fc80-4d0a-b346-6eef13fd7789
#ENV CLIENT_ALTERID 64
#ENV CLIENT_SECURITY auto
ENV VER=4.31.2

RUN apt-get update \
	&& apt-get install -y --no-install-recommends php-fpm php-curl php-cli php-mysql php-readline wget unzip openssl ca-certificates \
	&& mkdir /etc/caddy /usr/local/caddy \
	&& wget -N --no-check-certificate https://github.com/v2fly/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip -P /home && unzip -o /home/v2ray-linux-64.zip -d /etc/v2ray && chmod +x /etc/v2ray/v2ray && chmod +x /etc/v2ray/v2ctl \
	&& wget -N --no-check-certificate https://github.com/caddyserver/caddy/releases/download/v1.0.4/caddy_v1.0.4_linux_amd64.tar.gz -P /home && tar zxvf /home/caddy_v1.0.4_linux_amd64.tar.gz -C /etc/caddy && chmod +x /etc/caddy/caddy \
 	&& wget --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/service/caddy_debian -O /etc/init.d/caddy && chmod +x /etc/init.d/caddy && update-rc.d -f caddy defaults \
	&& mv /etc/caddy/caddy /usr/local/caddy/caddy

ADD html /var/www
ADD conf/www.conf /etc/php/7.2/fpm/pool.d/www.conf
ADD conf/config.json /etc/v2ray/config.json
ADD conf/Caddyfile /etc/caddy/Caddyfile
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT  /entrypoint.sh

EXPOSE 8080

