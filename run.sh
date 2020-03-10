#!/bin/bash
chmod +x /home/vcap/app/vss/v2ray
chmod +x /home/vcap/app/vss/v2ctl
chmod +x /home/vcap/app/vss/caddy
/home/vcap/app/vss/v2ray -config /home/vcap/app/vss/config.json &
/home/vcap/app/vss/caddy -conf /home/vcap/app/vss/Caddyfile -agree &
