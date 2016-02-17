#!/bin/sh
if [ -d "$PWD"/abuild ]; then
    sudo chown -Rv $(whoami) "$PWD"/abuild
fi

docker build --tag alpine-sdk .
