Dans le cadre de l'evolution de l'application j'ai choisi de mettre en avant la partie integration continu qui permettra une evolution constante du produit tant sur la forme que sur le fond ( du css en passant par la base de donnée) sans avoir a detruire l'infrastructure et en testant in vivo les evolutions que l'on souhaite appliquer.

Pour se faire jenkins est l'outils ideal:
==> dockerisable ( mise en place de volume persistant en local )
==> grande source documentaire pour aider a la mise en place
==> plugin nombreux pr k8s, ou pour faire de la review de code type OWASP ou NPM, grafana et prometheus pour la gestion 

L'emploi de K3S EST FORTEMENT RECOMMANDER DANS UN ENVIRONNEMENT REDUIT  tel que le propose cette application. de plus k3s est optimisé pour SQLITE ce qui dans notre cas convient parfaitement.
le but ici est de déployer l'infra docker-compose au sein du cluster k3s.
Pour ce faire on va utiliser un outils de conversion docker-compose.yml/k3s.yaml au travers d'un script en bash.
https://kubernetes.io/fr/docs/concepts/services-networking/dns-pod-service/
https://medium.com/@mwasnik7/devsecops-handson-deployed-netflix-clone-using-jenkins-cicd-b516cc0c8c8e
https://shubhamksawant.medium.com/deploy-jenkins-on-kubernetes-4ee7dec181de
