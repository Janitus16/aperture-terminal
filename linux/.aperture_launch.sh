#!/bin/bash

# Ventana logo — derecha
cool-retro-term --workdir ~ -e bash -c "bash ~/.aperture_animated.sh" &
disown
sleep 2

# Fullscreen ventana logo
xdotool search --name "cool-retro-term" key F11
sleep 0.5

# Ventana terminal — izquierda
cool-retro-term --workdir ~ &
disown
sleep 2

# Fullscreen ventana terminal
xdotool search --name "cool-retro-term" windowfocus key F11

sleep infinity
