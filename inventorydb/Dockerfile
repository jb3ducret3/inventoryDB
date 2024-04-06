
FROM python:3.9-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers de l'application dans le conteneur
COPY . /app/

# Installer les dépendances Python
RUN pip install Flask reportlab

# Exposer le port sur lequel l'application Flask s'exécutera
EXPOSE 8888

# Commande par défaut pour exécuter l'application Flask
CMD ["python", "inventory.py"]
