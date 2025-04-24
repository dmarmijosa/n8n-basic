FROM node:18-alpine

# Instalar n8n y PostgreSQL driver
RUN npm install -g n8n pg

# Variables estáticas
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=root
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV NODE_OPTIONS=--dns-result-order=ipv4first

EXPOSE 5678

# Comando de arranque dinámico usando la URL de Render
CMD ["sh", "-c", "export WEBHOOK_URL=$RENDER_EXTERNAL_URL && export N8N_HOST=$(echo $RENDER_EXTERNAL_URL | sed -e 's|https://||' -e 's|http://||') && n8n"]