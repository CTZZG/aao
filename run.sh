#!/bin/bash

PROC_NAME=caddy
ProcNumber=`ps -ef |grep -w $PROC_NAME|grep -v grep|wc -l`
if [ $ProcNumber -le 0 ];then
   chmod +x /home/vcap/app/vss/v2ray
   chmod +x /home/vcap/app/vss/v2ctl
   chmod +x /home/vcap/app/vss/caddy
   /home/vcap/app/vss/v2ray -config /home/vcap/app/vss/config.json &
   /home/vcap/app/vss/caddy -conf /home/vcap/app/vss/Caddyfile -agree &
else
   exit 0
fi
