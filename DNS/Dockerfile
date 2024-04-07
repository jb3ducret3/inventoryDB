FROM alpine:latest
RUN apk add --no-cache bind
COPY named.conf /etc/bind/named.conf
COPY inventairedb.localhost /etc/bind/inventairedb.localhost
EXPOSE 53/udp
CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "named"]
