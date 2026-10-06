#!/bin/bash

export XUI_PORT=${PORT:-8080}

/usr/local/x-ui/x-ui setting -port $XUI_PORT
/usr/local/x-ui/x-ui
