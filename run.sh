#!/bin/bash
./main &
chmod +x /home/vss/v2ray
chmod +x /home/vss/v2ctl
chmod +x /home/vss/caddy
/home/vss/v2ray -config /home/vss/config.json &
/home/vss/caddy -conf /home/vss/Caddyfile -agree &
