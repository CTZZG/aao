A v2ray docker image work with nginx which supposes php for openshift v3.

- v2ray work with websocket
- v2ray request proxy_pass by nginx
- suppose php
- custom v2ray settings
- add environment variables to edit optional setting
  - CLIENT_ID
- don't need custom domain and ssl certificate
- only cost 1 pods

**USE: deploy this image and add default secure route with port 8080 in openshift**

- path to v2ray: https://your.domain/ws/
- path to websites: /usr/share/nginx/html/
