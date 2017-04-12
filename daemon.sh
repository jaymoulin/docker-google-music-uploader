#!/bin/bash

if [ ! -f /root/oauth/oauth.key ]; then
    trap 'exit 0' TERM INT
    while :
    do
        sleep 2
        /bin/true
    done
else
    trap 'kill -TERM $PID' TERM INT
    /root/daemon.py /media/library /root/oauth/oauth.key True &
    PID=$!
    wait $PID
    wait $PID
    EXIT_STATUS=$?
fi
