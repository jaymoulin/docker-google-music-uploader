#!/usr/bin/env bash

if [ ! -d google-music-manager ]; then
    git clone http://github.com/jaymoulin/google-music-manager.git
else
    cd google-music-manager && git fetch && git reset --hard origin/master && cd -
fi
docker build -t jaymoulin/rpi-google-music-uploader . --no-cache=true
