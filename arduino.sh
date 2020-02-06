#!/bin/bash
# Starts the Arduino IDE using the docker image.
# see also: ...

#    -v /dev/ttyACM0:/dev/ttyACM0 \
#    -v /dev/ttyUSB0:/dev/ttyUSB0 \

# docker run \
#     -it \
#     --rm \
#     --network=host \
#     --privileged \
#     -e DISPLAY=$DISPLAY \
#     -v /tmp/.X11-unix:/tmp/.X11-unix \
#     -v /dev:/dev \
#     -v $HOME/code/arduino:/home/developer/arduino \
#     --name arduino \
#     arduino \
#     arduino


docker run \
       -it \
       --rm \
       --network=host \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v $HOME/code/arduino:/home/developer/arduino \
       --name arduino \
       arduino \
       arduino
