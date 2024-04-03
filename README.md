Le projet "InventaireDB" vise à créer une application d'inventaire légère et facilement déployable, utilisant Flask pour le backend, une base de données SQLite pour le stockage des données, et Docker pour la gestion des conteneurs. L'application est déployée avec Traefik en tant que reverse proxy pour gérer le routage du trafic HTTP/HTTPS et dnsmasq pour la résolution DNS locale.

Technologies utilisées
Python (Flask) : Framework web léger pour le backend de l'application.
SQLite : Système de gestion de base de données relationnelle embarqué pour le stockage des données.
Docker : Plateforme de conteneurisation pour encapsuler l'application et ses dépendances.
Docker Compose : Outil pour définir et exécuter des applications multi-conteneurs avec Docker.
Traefik : Reverse proxy et load balancer pour router le trafic vers les différents conteneurs.
dnsmasq : Serveur DNS léger pour la résolution DNS locale.
Installation et Configuration
Étape 1 : Pré-installations
Un script Bash est fourni pour automatiser les étapes d'installation et de configuration initiales. Il met à jour le système, installe Docker, Docker Compose, crée un environnement virtuel Python, clone le dépôt GitHub du projet, et lance l'application avec Docker Compose.

Étape 2 : Configuration DNS
Un autre script Bash configure dnsmasq pour la résolution DNS locale, en ajoutant une règle pour résoudre l'adresse "local" vers l'adresse IP privée de l'hôte.

Étape 3 : Piste d'améliorations
Le README propose d'intégrer Jenkins pour l'automatisation du pipeline CI/CD et K3s pour l'orchestration des conteneurs. Jenkins permettrait d'automatiser les tests, la construction et le déploiement de l'application, tandis que K3s offrirait une alternative légère à Kubernetes pour gérer les conteneurs dans un environnement distribué.

Licence
Ce projet est sous licence MIT, ce qui signifie que vous pouvez l'utiliser, le modifier et le distribuer librement, tant que vous incluez une copie de la licence dans toute distribution de code source ou de documentation.

Note : Assurez-vous de consulter le fichier LICENCE pour les détails de la licence MIT.
