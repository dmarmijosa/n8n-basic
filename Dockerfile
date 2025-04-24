FROM n8nio/n8n:latest

# Configura variables de entorno
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=root
ENV N8N_HOST=n8n-basic.onrender.com
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV WEBHOOK_URL=https://n8n-basic.onrender.com
ENV GENERIC_TIMEZONE=Europe/Madrid
ENV NODE_ENV=production

EXPOSE 5678

# Comando para iniciar n8n
CMD ["/usr/local/bin/n8n"]