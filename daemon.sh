#!/bin/bash
trap 'kill -TERM $PID' TERM INT

if [ ! -f /root/oauth ]; then
    while :
    do
        /bin/true
    done
else
    /root/daemon.py /media/library &
    PID=$!
    wait $PID
    wait $PID
    EXIT_STATUS=$?
fi
