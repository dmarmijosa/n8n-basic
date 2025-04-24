FROM node:18-alpine

# Instalar n8n
RUN npm install -g n8n

# Variables estáticas comunes
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=root
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production

EXPOSE 5678

# Iniciar dinámicamente usando variable automática de Render
CMD ["sh", "-c", "export NODE_OPTIONS='--dns-result-order=ipv4first' && export WEBHOOK_URL=$RENDER_EXTERNAL_URL && export N8N_HOST=$(echo $RENDER_EXTERNAL_URL | sed -e 's|https://||' -e 's|http://||') && n8n"]