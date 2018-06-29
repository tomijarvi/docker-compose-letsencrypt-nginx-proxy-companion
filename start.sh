#!/bin/bash
# Builds, (re)creates, starts, and attaches to containers for a service.

if [ ! -f nginx.tmpl ]; then
    curl -O https://raw.githubusercontent.com/jwilder/nginx-proxy/master/nginx.tmpl
fi

docker network create nginx-proxy
docker-compose pull
docker-compose up -d
