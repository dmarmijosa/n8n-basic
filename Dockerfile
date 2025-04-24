FROM n8nio/n8n:latest

# Variables de entorno
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

# 👉 Este CMD sí funciona porque Render lo ejecuta con una shell por defecto
CMD n8n