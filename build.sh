#!/usr/bin/env bash

git clone http://github.com/jaymoulin/google-music-uploader.git
docker build -t jaymoulin/rpi-google-music-uploader . --nocache=1