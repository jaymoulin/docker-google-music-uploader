FROM jaymoulin/rpi-python:alpine

MAINTAINER Jay MOULIN <jaymoulin@gmail.com>

RUN apk update && apk add gcc g++ ffmpeg && mkdir /root/oauth/ && \
    pip3 install watchdog gmusicapi bs4

ADD ./daemon.sh /root/daemon.sh
ADD ./google-music-manager/uploader-daemon.py /root/daemon.py
ADD ./google-music-manager/auth.py /root/auth.py
ADD ./auth.sh /root/auth
RUN chmod +x /root/daemon.py
RUN chmod +x /root/daemon.sh
RUN chmod +x /root/auth.py

VOLUME /media/library
VOLUME /root/oauth

WORKDIR /root
ENV PATH="/root:${PATH}"
CMD ["/root/daemon.sh"]
