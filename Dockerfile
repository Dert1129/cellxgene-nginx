FROM ubuntu:20.04

# Add starters and installers


RUN apt update -y \
  && apt upgrade -y \
  && apt-get install nginx -y \
  && apt-get install nano -y \
  && mkdir /certs/ \
  && apt-get install sudo \
  && apt-get install -y ufw 

RUN sudo apt-get install -y python3.8 \
  && sudo apt-get install -y python3.8-dev \
  && sudo apt-get install -y python3-distutils \
  && sudo apt-get install -y uwsgi \
  && sudo apt-get install -y uwsgi-src \
  && sudo apt-get install -y uuid-dev \
  && sudo apt-get install -y libcap-dev \
  && sudo apt-get install -y libpcre3-dev \
  && sudo apt-get install -y python3-pip \
  && sudo apt-get install -y python3.8-venv \
  && apt-get install -y uwsgi-plugin-python3 \
  && ufw allow 5000 \
  && sudo apt-get install -y build-essential python-dev \
  && sudo apt-get install -y python-is-python3 

RUN pip3 install cellxgene

# COPY ./container_files /
# COPY ./index.html /var/lib/nginx/html/index.html



EXPOSE 80
EXPOSE 443
EXPOSE 5000

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]