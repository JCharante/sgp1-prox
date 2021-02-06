#!/usr/bin/env bash
docker build -t jcharante/sgp1-prox . && docker push jcharante/sgp1-prox && docker-machine ssh nyc-drone-1 'docker service update --with-registry-auth --image jcharante/sgp1-prox proxy'
