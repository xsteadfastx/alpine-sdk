#!/bin/sh
docker run -ti --rm -v $PWD/keys:/etc/apk/keys -v $PWD/aports:/home/marv/aports -v $PWD/abuild:/home/marv/.abuild -v $PWD/abuild.conf:/etc/abuild.conf -v $PWD:/data alpine-sdk sh
