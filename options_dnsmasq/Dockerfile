# Utilisez une image Ubuntu 20.04 comme image de base
FROM ubuntu:20.04

# Mettre à jour les packages de la distribution
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y dnsmasq dnsutils ldnsutils && \
    apt-get clean

# Copier le script de configuration dans le conteneur
COPY dnsmasq_setup.sh /usr/local/bin/

# Donner les permissions d'exécution au script
RUN chmod +x /usr/local/bin/dnsmasq_setup.sh

# Exécuter le script lors du démarrage du conteneur
CMD ["/usr/local/bin/dnsmasq_setup.sh"]
