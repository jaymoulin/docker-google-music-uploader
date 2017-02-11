FROM resin/rpi-raspbian

MAINTAINER Jay MOULIN <jaymoulin@gmail.com>

RUN apt-get update && apt-get install python3-pip libav-tools build-essential -y
RUN pip3 install watchdog gmusicapi bs4

WORKDIR /root
ADD ./daemon.sh /root/daemon.sh
ADD ./google-music-uploader/daemon.py /root/daemon.py
ADD ./google-music-uploader/auth.py /root/auth.py
RUN chmod +x /root/daemon.py
RUN chmod +x /root/daemon.sh
RUN chmod +x /root/auth.py

VOLUME /media/library

CMD ["/root/daemon.sh"]
