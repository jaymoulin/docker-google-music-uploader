FROM jaymoulin/rpi-python:alpine

MAINTAINER Jay MOULIN <jaymoulin@gmail.com>

RUN apk update && \
    apk add gcc g++ linux-headers --no-cache --virtual .build-deps && \
    apk add ffmpeg && mkdir /root/oauth/ && \
    pip3 install MechanicalSoup==0.8.0 google-music-manager-uploader && \
    apk del gcc --purge .build-deps

ADD ./daemon.sh /root/daemon.sh

VOLUME /media/library
VOLUME /root/oauth

WORKDIR /root
ENV PATH="/root:${PATH}"
CMD ["/root/daemon.sh"]
