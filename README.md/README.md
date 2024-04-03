Projet d'Inventaire 📦
========================
Ce projet consiste en une application web pour gérer un inventaire, développée en utilisant Flask (Python).

=====================================================================================================================================

Contenu du projet 📋
=====================
Le projet comprend les éléments suivants :

Python Flask Application :

inventory.py : Le code source de l'application Flask, qui gère les routes et la logique métier.
templates : Répertoire contenant les fichiers HTML pour les pages web.
index.html : Page d'accueil de l'application.
inventory.html : Page affichant l'inventaire complet.
search.html : Page affichant les résultats de la recherche.
modify.html : Page permettant de modifier une entrée dans l'inventaire.
delete.html : Page permettant de supprimer une entrée de l'inventaire.
Dockerfile : Fichier utilisé pour construire une image Docker contenant l'application Flask.

Jenkinsfile : Pipeline Jenkins pour automatiser le processus de build, test, et déploiement.

==============================================================================================================

Processus de développement 🚀
=============================

Le processus de développement du projet est le suivant :

Commit sur GitHub :

Effectuez les modifications nécessaires dans le code source.
Effectuez un nouveau commit sur GitHub pour sauvegarder les changements.
Build avec Jenkins :

Jenkins détecte le nouveau commit et démarre le pipeline de build.
Le code est récupéré depuis GitHub et testé.
Création de l'image Docker :

Si les tests réussissent, Jenkins construit une nouvelle image Docker à partir du Dockerfile.
L'image contient l'application Flask prête à être exécutée.
Envoi vers Docker Hub :

L'image Docker est envoyée vers Docker Hub pour être partagée et utilisée par d'autres.
Assurez-vous que les informations d'identification Docker Hub sont configurées dans Jenkins pour permettre l'envoi.
Exécution sur un serveur distant :

Une fois l'image Docker disponible sur Docker Hub, elle peut être récupérée et exécutée sur un serveur distant.
Utilisez la commande docker run pour exécuter le conteneur Docker sur le serveur distant.

======================================================================================================================

Conclusion 🎉
============
Voilà, vous avez maintenant toutes les clés en main pour révolutionner l'organisation de vos bureaux ! 😄
