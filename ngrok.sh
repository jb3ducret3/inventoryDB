#!/bin/bash

# Configuration de votre token ngrok (remplacez "your_ngrok_authtoken" par votre token réel)
NGROK_TOKEN="your_ngrok_authtoken"

# Le port que votre application locale utilise
LOCAL_PORT=8888

# Authentifier votre session ngrok (uniquement nécessaire si pas déjà configuré)
ngrok authtoken $NGROK_TOKEN

# Démarrer ngrok en arrière-plan sur le port local spécifié
ngrok http $LOCAL_PORT > /dev/null &

# Donner un peu de temps à ngrok pour se lancer et établir une connexion
sleep 5

# Récupérer l'URL ngrok en utilisant l'API de ngrok
NGROK_URL=$(curl --silent http://127.0.0.1:4040/api/tunnels | jq -r '.tunnels[0].public_url')

# Afficher l'URL
echo "Votre URL ngrok est: $NGROK_URL"

# Maintenant, vous pouvez accéder à votre application via cette URL publique!
