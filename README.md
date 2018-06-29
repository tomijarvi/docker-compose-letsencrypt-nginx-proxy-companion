# Docker compose for the NGINX reverse proxy with Let's Encrypt SSL

## Prerequisites
* Docker Engine >= 18.02.0+
* docker-compose >= 1.20.0

## How to use
1. Clone the repository
```bash
$ git clone https://github.com/tomijarvi/docker-compose-letsencrypt-nginx-proxy-companion.git
```

2. Start the compose
```bash
$ . start.sh
````

3. Create the `docker-compose.yml` file and run the app
```yaml
# docker-compose.yml
version: '2'

services:
  whoami:
    image: jwilder/whoami
    environment:
      - VIRTUAL_HOST=example.com,www.example.com
      - LETSENCRYPT_HOST=www.example.com
      - LETSENCRYPT_EMAIL=example@example.com
    networks:
      - app-network
      - nginx-proxy

networks:
  app-network:
    driver: bridge
  nginx-proxy:
    external: true
```

```bash
$ docker-compose up -d
```
