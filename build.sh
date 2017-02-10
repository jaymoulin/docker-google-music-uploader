#!/usr/bin/env bash

if [ ! -d google-music-uploader ]; then
    git clone http://github.com/jaymoulin/google-music-uploader.git
else
    cd google-music-uploader && git pull && cd -
fi
docker build -t jaymoulin/rpi-google-music-uploader . --no-cache=true