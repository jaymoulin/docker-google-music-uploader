FROM jaymoulin/rpi-python:alpine

MAINTAINER Jay MOULIN <jaymoulin@gmail.com>

RUN apk update && \
	apk add git gcc g++ linux-headers --no-cache --virtual .build-deps && \
	git clone https://github.com/jaymoulin/google-music-manager.git /root/manager && \
	apk add ffmpeg && mkdir /root/oauth/ && \
    pip3 install watchdog gmusicapi bs4 netifaces && \
	apk del git --purge .build-deps

ADD ./daemon.sh /root/daemon.sh
RUN mv /root/manager/uploader-daemon.py /root/daemon.py
RUN mv /root/manager/auth.py /root/auth.py
ADD ./auth.sh /root/auth
RUN chmod +x /root/daemon.py
RUN chmod +x /root/daemon.sh
RUN chmod +x /root/auth.py

VOLUME /media/library
VOLUME /root/oauth

WORKDIR /root
ENV PATH="/root:${PATH}"
CMD ["/root/daemon.sh"]
