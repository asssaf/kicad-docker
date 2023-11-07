#!/usr/bin/env bash

#DISPLAY=:1
IMAGE=asssaf/kicad

mkdir -p $PWD/mnt

docker run \
        -it \
        --rm \
        --name kicad \
        --network=host \
        -u $UID \
        -e DISPLAY=$DISPLAY \
        -v $HOME/.Xauthority:/home/user/.Xauthority \
        -v $PWD/mnt:/home/user/mnt \
        $IMAGE \
        kicad
