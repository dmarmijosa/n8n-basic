#!/bin/bash

# Iniciar ngrok en segundo plano con dominio reservado
ngrok http 5678 --domain=legal-full-cockatoo.ngrok-free.app > /dev/null &
sleep 3

# Definir URL personalizada directamente
NGROK_URL="https://legal-full-cockatoo.ngrok-free.app"
echo "🔗 ngrok URL: $NGROK_URL"

# Setear variables necesarias para n8n
export N8N_HOST="legal-full-cockatoo.ngrok-free.app"
export WEBHOOK_URL=$NGROK_URL

# Abrir en el navegador si es posible
if command -v xdg-open &> /dev/null; then
  xdg-open "$NGROK_URL"
elif command -v open &> /dev/null; then
  open "$NGROK_URL"
else
  echo "🌐 Copia esta URL y pégala en tu navegador: $NGROK_URL"
fi

# Iniciar n8n
exec n8n