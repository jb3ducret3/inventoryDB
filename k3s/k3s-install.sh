sudo apt update & upgrade -y
sudo apt isntall curl -y
sudo apt install openssh 
curl -sfL https://get.k3s.io | sh -
cat
K3S_TOKEN:$
K3S_URL:$10.10.10.10:6443
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

