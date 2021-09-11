FROM traefik:v1.7-alpine
MAINTAINER "me@example.com"
RUN apk add --update \
    bash \
  && rm -rf /var/cache/apk/*
COPY ./certs/htpasswd /etc/traefik.htpasswd
ADD ./traefik.toml /etc/traefik.toml
