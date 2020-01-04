FROM ubuntu:18.04

#ENV CLIENT_ID
#ENV CLIENT_ALTERID 64
#ENV CLIENT_SECURITY aes-128-gcm
ENV VER=4.22.1

RUN apt-get update \
	&& apt-get install -y --no-install-recommends php-fpm php-curl php-cli php-mysql php-readline wget unzip \
	&& wget -N --no-check-certificate https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip && unzip -o v2ray-linux-64.zip -d /etc/v2ray && chmod +x /etc/v2ray/v2ray && chmod +x /etc/v2ray/v2ctl  \
	&& wget -N --no-check-certificate https://raw.githubusercontent.com/renchen1994/aao/Aru-1/www.zip && unzip -o www.zip -d /var/www \
	&& wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/caddy_install.sh && chmod +x caddy_install.sh && bash caddy_install.sh

ADD conf/www.conf /etc/php/7.2/fpm/pool.d/www.conf
ADD conf/config.json /etc/v2ray/config.json
ADD conf/Caddyfile /usr/local/caddy/Caddyfile
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT  /entrypoint.sh

EXPOSE 80

