



                                                                                          EN COURS



Dans le cadre de l'evolution de l'application j'ai choisi de mettre en avant la partie integration continu qui permettra une evolution constante du produit tant sur la forme que sur le fond ( du css en passant par la base de donnée) sans avoir a detruire l'infrastructure et en testant in vivo les evolutions que l'on souhaite appliquer.

Pour se faire jenkins est l'outils ideal:
==> dockerisable ( mise en place de volume persistant en local )
==> grande source documentaire pour aider a la mise en place
==> plugin nombreux pr k8s, ou pour faire de la review de code type OWASP ou NPM, grafana et prometheus pour la gestion

dans le cadre du PCA/PRA, de la scalabiité du projet , ainsi que sa gestion, j'ai choisi d'utiliser une version allegée d'un outils preformant KUBERNETES.++>K3S.
k3s:
==>moins lourd que k8s
==>optimiser sqlite (ca tombe bien)
==> souple d'utilisaton.
==>fichier DockerCompose.yml/K8Sfile.yaml komvert compose
L'idée ici erst de convertir l'infra docker-compose au sein du cluster k3s.
Pour ce faire on va utiliser un outils de conversion docker-compose.yml/k3s.yaml au travers d'un script en bash.
https://kubernetes.io/fr/docs/concepts/services-networking/dns-pod-service/
https://medium.com/@mwasnik7/devsecops-handson-deployed-netflix-clone-using-jenkins-cicd-b516cc0c8c8e
https://shubhamksawant.medium.com/deploy-jenkins-on-kubernetes-4ee7dec181de
(https://kompose.io/)
