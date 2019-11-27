FROM alpine:3.10

MAINTAINER Bob Huang version: 0.1

# # Setup Proxy if required
# ENV http_proxy=http://[PROXY:PORT] \
#   https_proxy=http://[PROXY:PORT] \
#   HTTP_PROXY=http://[PROXY:PORT] \
#   HTTPS_PROXY=http://[PROXY:PORT]

# Install dependencies
RUN apk add --no-cache \
  gcc libc-dev linux-headers \
  bash git nginx uwsgi uwsgi-python python2-dev py2-pip \
  && pip2 install --upgrade pip

# Install uwsgi installation required gcc etc packages
RUN apk add --no-cache --virtual .build-deps \
    gcc \
    libc-dev \
    linux-headers

# Install requirements.txt globally
COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Remove gcc
RUN apk del .build-deps

# copy config files into filesystem
COPY nginx.conf /etc/nginx/nginx.conf

# application folder
ENV APP_DIR /app

# app working dir
RUN mkdir ${APP_DIR} \
  && chown -R nginx:nginx ${APP_DIR} \
  && chmod 777 /run/ -R \
  && chmod 777 /root/ -R
VOLUME ${APP_DIR}
WORKDIR ${APP_DIR}

# expose Nginx web server port
EXPOSE 80

