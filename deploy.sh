#!/usr/bin/env bash
CMD="docker service create --name proxy --with-registry-auth -p 80:80 -p 443:443 jcharante/sgp1-prox"
docker build -t jcharante/sgp1-prox . && docker push jcharante/sgp1-prox && eval "docker-machine ssh nyc-drone-1 '${CMD}'"
