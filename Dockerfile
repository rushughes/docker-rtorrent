FROM alpine:latest

RUN apk add --update rtorrent php7 php7-fpm php7-opcache php7-gd php7-mysqli \
    php7-zlib php7-curl mediainfo sox curl ffmpeg unrar shadow && \
    mkdir -p /downloads/completed && \
    mkdir -p /downloads/incoming && \
    mkdir -p /downloads/watching && \
    mkdir -p /downloads/session && \
    mkdir -p /var/run/rtorrent

RUN adduser -D -h /home/rtorrent -u 1000 rtorrent

RUN chown rtorrent:rtorrent /downloads/* /var/run/rtorrent

COPY rtorrent.rc /home/rtorrent/.rtorrent.rc

USER rtorrent

EXPOSE 51413 6881

VOLUME ["/downloads", "/var/run/rtorrent"]

ENTRYPOINT ["rtorrent"]
#CMD  ["rtorrent"]
