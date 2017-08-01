#!/bin/bash

# docker pull jerivas/popcorntime
# Ref: https://hub.docker.com/r/jerivas/popcorntime/

if [ $# -gt 0 ]; then
    ENTRYPOINT="--entrypoint $@"
fi

xhost +

docker run \
    -it --rm \
    --net host \
    --memory 512mb \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    --device /dev/snd \
    --device /dev/dri \
    --name popcorntime \
    $ENTRYPOINT \
	jerivas/popcorntime 
    

#    -e http_proxy=localhost:3128 \
    
