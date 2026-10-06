#!/bin/bash

/usr/bin/x-ui &
sleep 3

envsubst '${PORT}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

nginx -g "daemon off;"
