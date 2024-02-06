FROM nginx:stable-alpine3.17-perl
COPY ./default.conf /etc/nginx/conf.d
COPY ./index.html /usr/share/nginx/home/
RUN apk update && apk upgrade
RUN apk add bash
