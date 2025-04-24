#!/bin/bash

# Iniciar ngrok en segundo plano
ngrok http 5678 > /dev/null &
sleep 3  # Espera a que ngrok levante

# Obtener la URL pública de ngrok
NGROK_URL=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')
echo "NGROK URL: $NGROK_URL"

# Exportar como variables de entorno
export N8N_HOST=$(echo $NGROK_URL | sed -e 's|https://||' -e 's|http://||')
export WEBHOOK_URL=$NGROK_URL

# Levantar el contenedor Docker con las variables actualizadas
docker-compose up