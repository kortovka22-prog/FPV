#!/bin/bash

# Сброс пароля, чтобы не выкидывало при пересборке
/usr/local/x-ui/x-ui setting -username admin -password admin

export XUI_PORT=${PORT:-8080}
/usr/local/x-ui/x-ui setting -port $XUI_PORT

/usr/local/x-ui/x-ui
