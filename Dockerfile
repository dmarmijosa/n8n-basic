FROM node:18-alpine

# Instalar dependencias
RUN apk add --no-cache curl jq bash

# Instalar ngrok
RUN curl -s https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -o ngrok.zip && \
    unzip ngrok.zip && mv ngrok /usr/local/bin && rm ngrok.zip

# Instalar n8n
RUN npm install -g n8n

# Copiar script de inicio
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=root
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV NODE_OPTIONS=--dns-result-order=ipv4first

EXPOSE 5678

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]