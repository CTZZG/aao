FROM nginx:latest

#ENV CLIENT_ID
#ENV CLIENT_ALTERID 64
#ENV CLIENT_SECURITY aes-128-gcm
ENV VER=4.20.0

ADD conf/nginx.conf /etc/nginx/
ADD conf/default.conf /etc/nginx/conf.d/

RUN apt-get update \
	&& apt-get install -y --no-install-recommends php-fpm php-curl php-cli php7.3-mcrypt php-mysql php-readline wget unzip \
	&& chmod -R 777 /var/log/nginx /var/cache/nginx /var/run \
	&& chgrp -R 0 /etc/nginx \
	&& chmod -R g+rwx /etc/nginx \
	&& mkdir /run/php/ \
	&& chmod -R 777 /var/log/ /run/php/ \
	&& mkdir /var/log/v2ray \
	&& chmod -R 777 /var/log/v2ray \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/cache/apt/* \
	&& mkdir -m 777 /v2ray \
	&& cd /v2ray \
	&& wget https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip --no-cookie --no-check-certificate \
	&& unzip v2ray-linux-64.zip \
#	&& mv /v2ray/v2ray-v$VER-linux-64/v2ray /v2ray/ \
#	&& mv /v2ray/v2ray-v$VER-linux-64/v2ctl /v2ray/ \
#	&& mv /v2ray/v2ray-v$VER-linux-64/geoip.dat /v2ray/ \
#	&& mv /v2ray/v2ray-v$VER-linux-64/geosite.dat /v2ray/ \
	&& chmod +x /v2ray/v2ray /v2ray/v2ctl \
	&& rm -rf v2ray-linux-64.zip \
#	&& rm -rf v2ray-v$VER-linux-64 \
	&& chgrp -R 0 /v2ray \
	&& chmod -R g+rwX /v2ray 

ADD entrypoint.sh /entrypoint.sh
ADD conf/config.json /v2ray/config.json
ADD conf/www.conf /etc/php/7.0/fpm/pool.d/
ADD html /usr/share/nginx/html/
RUN chmod +x /entrypoint.sh
ENTRYPOINT  /entrypoint.sh

EXPOSE 80
