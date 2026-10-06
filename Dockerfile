FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl bash ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then ARCH="amd64"; fi && \
    if [ "$ARCH" = "aarch64" ]; then ARCH="arm64"; fi && \
    curl -L -o /tmp/x-ui.tar.gz "https://github.com/MHSanaei/3x-ui/releases/latest/download/x-ui-linux-${ARCH}.tar.gz" && \
    mkdir -p /usr/local/x-ui/ && \
    tar -zxf /tmp/x-ui.tar.gz -C /usr/local/x-ui/ --strip-components=1 && \
    rm /tmp/x-ui.tar.gz && \
    chmod +x /usr/local/x-ui/x-ui

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
