#!/bin/bash
./main &
chmod +x ./vss/v2ray
chmod +x ./vss/v2ctl
chmod +x ./vss/caddy
./vss/v2ray -config ./vss/config.json &
./vss/caddy -conf ./vss/Caddyfile -agree &
