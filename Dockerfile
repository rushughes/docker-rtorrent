FROM alpine:latest

RUN apk add --update rtorrent && \
    mkdir -p /downloads/completed && \
    mkdir -p /downloads/incoming && \
    mkdir -p /downloads/watched && \
    mkdir -p /downloads/session && \
    mkdir -p /var/run/rtorrent

COPY rtorrent.rc ~/.rtorrent.rc

EXPOSE 51413 6881

VOLUME ["/downloads", "/var/run/rtorrent"]

ENTRYPOINT ["rtorrent"]
#CMD  ["rtorrent"]
