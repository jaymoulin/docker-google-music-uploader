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
    PARAMS = ''
    if [[ "$REMOVE" ]]; then
        PARAMS="-r"
    fi
    if [[ "$UPLOADER_ID" ]]; then
        PARAMS="$PARAMS --uploader_id $UPLOADER_ID"
    fi
    `google-music-upload -d /media/library -a /root/oauth/oauth.key $PARAMS &`
    PID=$!
    wait $PID
    wait $PID
    EXIT_STATUS=$?
fi
