FROM jaymoulin/rpi-python:alpine

MAINTAINER Jay MOULIN <jaymoulin@gmail.com>

RUN apk update && \
    apk add gcc g++ linux-headers --no-cache --virtual .build-deps && \
    apk add ffmpeg && mkdir /root/oauth/ && \
    pip3 install googlemusicmanager && \
    apk del git --purge .build-deps

ADD ./daemon.sh /root/daemon.sh
ADD ./auth.sh /root/auth
RUN chmod +x /root/daemon.py
RUN chmod +x /root/daemon.sh
RUN chmod +x /root/auth.py

VOLUME /media/library
VOLUME /root/oauth

WORKDIR /root
ENV PATH="/root:${PATH}"
CMD ["/root/daemon.sh"]
