FROM alpine:latest

RUN apk add --update rtorrent php7 php7-fpm php7-opcache php7-gd php7-mysqli \
    php7-zlib php7-curl mediainfo sox curl ffmpeg unrar && \
    mkdir -p /downloads/completed && \
    mkdir -p /downloads/incoming && \
    mkdir -p /downloads/watching && \
    mkdir -p /downloads/session && \
    mkdir -p /var/run/rtorrent

RUN adduser -g 1000 rtorrent && \
    adduser -D -h /home/rtorrent -u 1000 -g rtorrent rtorrent

RUN chown rtorrent:rtorrent /downloads/* /var/run/rtorrent

COPY rtorrent.rc /home/rtorrent/.rtorrent.rc

USER rtorrent

EXPOSE 51413 6881

VOLUME ["/downloads", "/var/run/rtorrent"]

ENTRYPOINT ["rtorrent"]
#CMD  ["rtorrent"]
