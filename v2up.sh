#!/bin/sh
read -p "请输入版本号:" VER
echo "版本号为：$VER"
wget https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip
systemctl stop v2ray
unzip -o v2ray-linux-64.zip
cp -f v2ray v2ctl geoip.dat geosite.dat /etc/v2ray
chmod +x /etc/v2ray/v2ray v2ctl
systemctl start v2ray
rm -rf doc  geoip.dat  geosite.dat systemd  systemv  v2ctl  v2ctl.sig  v2ray  v2ray-linux-64.zip  v2ray.sig  vpoint_socks_vmess.json  vpoint_vmess_freedom.json config.json
echo "v2ray更新成功"
exit 0