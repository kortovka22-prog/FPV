#!/bin/bash

# Railway даёт порт в переменной $PORT
export XUI_PORT=${PORT:-8080}

# Запускаем 3X-UI на этом порту
/usr/local/x-ui/x-ui setting -port $XUI_PORT
/usr/local/x-ui/x-ui
