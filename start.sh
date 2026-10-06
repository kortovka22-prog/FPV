#!/bin/bash

envsubst '${PORT}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
nginx -g "daemon off;" &

/usr/bin/x-ui
