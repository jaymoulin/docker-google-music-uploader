#!/bin/sh

if [ -f /root/oauth ]
then
    /root/auth.py
else
    /root/daemon.py /media/library
fi