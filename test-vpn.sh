https://static.les-enovateurs.com/uploads/2019/06/G%C3%A9n%C3%A9ration-de-la-cl%C3%A9-priv%C3%A9-du-serveur-VPN.png
mkdir -p ~/openvpn/data
docker run -v ~/openvpn/data:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_genconfig -u udp://vpn.inventairedb.local
docker run -v ~/openvpn/data:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn ovpn_initpki
nano docker-compose.yml
openvpn:
    image: "kylemanna/openvpn:latest"
    container_name: openvpn
    ports:
        - "1194:1194/udp"
    volumes:
        - "~/openvpn/data:/etc/openvpn"
    cap_add:
        - NET_ADMIN
    restart: always

docker-compose up -d 
docker run -v ~/openvpn/data:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn easyrsa build-client-full inventaireclient

docker run -v ~/openvpn/data:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_getclient nom_client > inventaireclient.ovpn
