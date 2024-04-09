sudo apt update & upgrade -y
sudo apt isntall curl -y
sudo apt install openssh 
curl -sfL https://get.k3s.io | sh -
cat /var/lib/rancher/k3s/server/node-token 
K3S_TOKEN:$
K3S_URL:$10.10.10.10:6443
node1=$10.10.10.20
ssh worker@node1 curl -sfL https://get.k3s.io | K3S_URL=https://myserver:6443 K3S_TOKEN=mynodetoken sh -
cd /home/inventairedb/
curl -L https://github.com/kubernetes/kompose/releases/download/v1.16.0/kompose-linux-amd64 -o kompose
chmod +x kompose
sudo mv ./kompose /usr/local/bin/kompose
kompose convert
kubectl apply -f frontend-service.yaml,redis-master-service.yaml,redis-slave-service.yaml,frontend-deployment.yaml,redis-master-deployment.yaml,redis-slave-deployment.yaml
if i=*.yaml; then
mv i k3s
fi
kubectl apply -f *.yaml
kubectl get nodes

curl inventairedb.localhost

if [ $? -ne 0 ]; then
    echo "Erreur lors de la construction des Pods de l'appli."
    exit 1
fi

https://medium.com/47billion/playing-with-kubernetes-using-k3d-and-rancher-78126d341d23 K3D.
https://cours.brosseau.ovh/tp/ci/kubernetes/deploy-container-in-kubernetes.html
https://www.sokube.io/blog/k3d-k3s-k8s-perfect-match-for-dev-and-testing
