FROM alpine:latest

RUN apk add --no-cache nginx curl unzip bash gettext

# Установка x-ui в систему
RUN curl -L https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh -o /tmp/install.sh && \
    chmod +x /tmp/install.sh && \
    echo -e "y\nadmin\nadmin\n54321\n" | /tmp/install.sh && \
    mv /usr/local/x-ui/x-ui /usr/local/bin/x-ui

# Копируем конфиг nginx
COPY nginx.conf.template /etc/nginx/nginx.conf.template

# Копируем скрипт запуска
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080
CMD ["/start.sh"]
