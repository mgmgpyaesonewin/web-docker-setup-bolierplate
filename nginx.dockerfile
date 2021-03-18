FROM nginx:stable-alpine

ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/html

RUN mkdir -p /etc/nginx/certs/mkcerts

ADD ./nginx/certs/ /etc/nginx/certs/mkcert