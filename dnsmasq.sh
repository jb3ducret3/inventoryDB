#!bin/bash  
sudo apt update
sudo apt upgrade
sudo apt install dsnmasq -y
systemctl disable --now systemd-resolved
# rm -rf /etc/resolv.conf # ==> prkoi ?
echo "nameserver 8.8.8.8" > /etc/resolv.conf
apt-get install dnsmasq dnsutils ldnsutils -y
systemctl status dnsmasq
echo "port=53
      domain-needed
      bogus-priv
      listen-address=127.0.0.1,$ip_local
      expand-hosts
      domain=inventaire.local
      cache-size=1000" > /etc/dnsmasq.conf  #dnsmasq /!\
echo " nameserver $ip_local
       dnsmasq --test" > /etc/resolv.conf
systemctl restart dnsmasq
echo "$ip_local inventairedb.local" > /etc/hosts
dig inventaire.local+short
drill google.com | grep "Query time"

