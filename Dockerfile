# FROM ubuntu:18.04
FROM nginx:alpine

# RUN apt-get update
# RUN apt-get install -y nginx

# WORKDIR /usr/src/sgp1-prox

COPY origin_ca_rsa_root.pem /etc/ssl/certs/

COPY jcharante.com.fullchain.pem /etc/ssl/certs/
COPY jcharante.com.privkey.pem /etc/ssl/private/

COPY fullchain.pem /etc/ssl/certs/
COPY privkey.pem /etc/ssl/private/

#COPY default /etc/nginx/sites-enabled/default
COPY default /etc/nginx/conf.d/default.conf

RUN nginx -t

# CMD nginx

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
