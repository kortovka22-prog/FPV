FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl bash ca-certificates unzip \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем 3x-ui
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then ARCH="amd64"; fi && \
    if [ "$ARCH" = "aarch64" ]; then ARCH="arm64"; fi && \
    curl -L -o /tmp/x-ui.tar.gz "https://github.com/MHSanaei/3x-ui/releases/latest/download/x-ui-linux-${ARCH}.tar.gz" && \
    mkdir -p /usr/local/x-ui/ && \
    tar -zxf /tmp/x-ui.tar.gz -C /usr/local/x-ui/ --strip-components=1 && \
    rm /tmp/x-ui.tar.gz

# Принудительно скачиваем Xray и кладём в bin 3x-ui
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then ARCH="64"; fi && \
    if [ "$ARCH" = "aarch64" ]; then ARCH="arm64-v8a"; fi && \
    mkdir -p /usr/local/x-ui/bin/ && \
    curl -L -o /tmp/xray.zip "https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-${ARCH}.zip" && \
    unzip /tmp/xray.zip -d /usr/local/x-ui/bin/ && \
    rm /tmp/xray.zip && \
    chmod +x /usr/local/x-ui/bin/xray

# Создаём симлинк для 3x-ui
RUN ln -s /usr/local/x-ui/bin/xray /usr/local/x-ui/bin/xray-linux-amd64

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
