#!bin/bash  
sudo apt update
sudo apt upgrade
sudo apt install dsnmasq -y
systemctl disable --now systemd-resolved
rm -rf /etc/resolv.conf # ==> prkoi ?
echo "nameserver 8.8.8.8" > /etc/resolv.conf
apt-get install dnsmasq dnsutils ldnsutils -y
systemctl status dnsmasq
nano /etc/dnsmasq.conf  #dnsmasq /!\
port=53
domain-needed
bogus-priv
listen-address=127.0.0.1,$ip_local
expand-hosts
domain=inventaire.local
cache-size=1000
nano /etc/resolv.conf
nameserver $ip_local
dnsmasq --test
systemctl restart dnsmasq
nano /etc/hosts
$ip_local inventairedb.local
dig inventaire.local+short
drill google.com | grep "Query time"

