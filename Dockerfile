# Utilisez l'image de base Debian
FROM debian

# Mise à jour du système et installation de Python 3 et pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean

# Installation de Flask
RUN apt update && apt install -y python3-flask

# Créez un répertoire de travail pour l'application
WORKDIR /app

# Copiez les fichiers de l'application dans le conteneur
COPY . /app/

# Exposez le port sur lequel l'application Flask s'exécutera
EXPOSE 8888

# Commande par défaut pour exécuter l'application Flask
CMD ["python3", "inventory.py"]
