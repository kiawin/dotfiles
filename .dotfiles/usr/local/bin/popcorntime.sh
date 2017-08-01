#!/bin/bash

# docker pull jerivas/popcorntime
# Ref: https://hub.docker.com/r/jerivas/popcorntime/

if [ $# -gt 0 ]; then
    ENTRYPOINT="--entrypoint $@"
fi

# docker pull jerivas/popcorntime

# Ref: https://stackoverflow.com/questions/28392949/running-chromium-inside-docker-gtk-cannot-open-display-0
# Ref: https://stackoverflow.com/questions/28392949/running-chromium-inside-docker-gtk-cannot-open-display-0/34586732#34586732
xhost local:root

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
    
