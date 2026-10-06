#!/bin/bash

# Сброс пароля на admin/admin при каждом запуске
/usr/local/x-ui/x-ui setting -username admin -password admin

export XUI_PORT=${PORT:-8080}
/usr/local/x-ui/x-ui setting -port $XUI_PORT

# Запускаем панель
/usr/local/x-ui/x-ui
