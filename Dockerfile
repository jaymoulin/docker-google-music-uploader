FROM jaymoulin/rpi-python:3.6.1

MAINTAINER Jay MOULIN <jaymoulin@gmail.com>

RUN apt-get update && apt-get install libav-tools build-essential -y && mkdir /root/oauth/ && \
    pip3 install watchdog gmusicapi bs4 && apt-get clean && apt-get autoremove -y

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
CMD ["/root/daemon.sh"]
