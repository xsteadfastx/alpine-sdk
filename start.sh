#!/bin/sh
docker run -ti --rm -v $PWD/keys:/etc/apk/keys -v $PWD/aports:/home/marv/aports -v $PWD:/data alpine-sdk sh
