FROM alpine:3.14

# Add starters and installers
COPY ./container_files /opt
COPY . /tmp

RUN apk add nginx