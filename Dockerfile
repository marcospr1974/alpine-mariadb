FROM alpine:latest

MAINTAINER "Marcos Pablo Russo version: 0.1"

COPY repositories /etc/apk/repositories

ENV LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    DB_USER="root" \
    DB_PASS="debian" \
    TERM="xterm"

RUN apk update && apk upgrade 
RUN apk add alpine-base bash vim  \
        openssl \          
        mariadb-client mariadb-common mariadb && rm -rf /var/cache/apk/*

ADD start.sh /start.sh
RUN chmod u+x /start.sh

EXPOSE 3306
VOLUME ["/etc/mysql", "/var/lib/mysql"]

CMD ["/start.sh"]
