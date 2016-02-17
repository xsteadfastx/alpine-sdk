#!/bin/sh
for i in /home/marv/.abuild /home/marv/aports /home/marv/packages
do
    if [ -d "$i" ]; then
        sudo chown -R marv:marv "$i"
    fi
done

sudo apk update

exec "$@"
