# FROM ubuntu:18.04
FROM nginx:alpine

# RUN apt-get update
# RUN apt-get install -y nginx

# WORKDIR /usr/src/sgp1-prox

COPY origin_ca_rsa_root.pem /etc/ssl/certs/

#COPY jcharante.com.fullchain.pem /etc/ssl/certs/
#COPY jcharante.com.privkey.pem /etc/ssl/private/

COPY jcharante.com/fullchain.pem /etc/ssl/certs/jcharante.com.fullchain.pem
COPY jcharante.com/privkey.pem /etc/ssl/private/jcharante.com.privkey.pem

COPY jyanz.com/fullchain.pem /etc/ssl/certs/jyanz.com.fullchain.pem
COPY jyanz.com/privkey.pem /etc/ssl/private/jyanz.com.privkey.pem

COPY yourfinalgrade.com/fullchain.pem /etc/ssl/certs/yourfinalgrade.com.fullchain.pem
COPY yourfinalgrade.com/privkey.pem /etc/ssl/private/yourfinalgrade.com.privkey.pem

#COPY fullchain.pem /etc/ssl/certs/
#COPY privkey.pem /etc/ssl/private/

#COPY default /etc/nginx/sites-enabled/default
COPY default /etc/nginx/conf.d/default.conf

RUN nginx -t

# CMD nginx

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
