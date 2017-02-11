#!/bin/sh

if [ ! -f /root/oauth ]; then
    while :
    do
        /bin/true
    done
else
    /root/daemon.py /media/library
fi
