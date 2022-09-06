FROM ubuntu:18.04

# Add starters and installers


RUN apt update -y \
  && apt upgrade -y \
  && apt install nginx -y \
  && apt install nano -y \
  && mkdir /certs/ \
  && apt install sudo \
  && apt install -y ufw 

RUN sudo apt install -y python3.8 \
  && sudo apt install -y python3.8-dev \
  && sudo apt install -y python3-distutils \
  && sudo apt install -y uwsgi \
  && sudo apt install -y uwsgi-src \
  && sudo apt install -y uuid-dev \
  && sudo apt install -y libcap-dev \
  && sudo apt install -y libpcre3-dev \
  && sudo apt install -y python3-pip \
  && sudo apt install -y python3.8-venv \
  && apt-get install -y uwsgi-plugin-python3 \
  && ufw allow 5000 \
  && sudo apt-get install -y build-essential python-dev 

RUN alias python=python3.8 
# alias command isn't running
# RUN pip3 install cellxgene

# COPY ./container_files /
# COPY ./index.html /var/lib/nginx/html/index.html
COPY ./wsgi.py /

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]