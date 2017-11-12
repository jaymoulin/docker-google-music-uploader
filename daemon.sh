#!/bin/sh

if [ ! -f /root/oauth/oauth.key ]; then
    trap 'exit 0' TERM INT
    while :
    do
        sleep 2
        /bin/true
    done
else
    trap 'kill -TERM $PID' TERM INT
    google-music-upload -d /media/library -a /root/oauth/oauth.key -r &
    PID=$!
    wait $PID
    wait $PID
    EXIT_STATUS=$?
fi
