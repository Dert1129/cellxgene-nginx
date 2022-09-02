FROM alpine:3.14

# Add starters and installers


RUN apk update \
  && apk add nginx \
  && apk add nano \
  && mkdir /certs/

COPY ./container_files /
COPY ./index.html /var/lib/nginx/html/index.html

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]