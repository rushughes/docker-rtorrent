FROM alpine:latest

RUN apk add --update rtorrent php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl && \
    mkdir -p /downloads/completed && \
    mkdir -p /downloads/incoming && \
    mkdir -p /downloads/watched && \
    mkdir -p /downloads/session && \
    mkdir -p /var/run/rtorrent

COPY rtorrent.rc /root/.rtorrent.rc

EXPOSE 51413 6881

VOLUME ["/downloads", "/var/run/rtorrent"]

ENTRYPOINT ["rtorrent"]
#CMD  ["rtorrent"]
