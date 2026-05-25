#!/bin/bash
clear
cat ~/.aperture_logo_static

LINES=$(tput lines)
CRITICAL_LINE=$((LINES-2))

while true; do
    tput cup $CRITICAL_LINE 0
    printf " CORE INTEGRITY: CRITICAL !"
    sleep 0.8
    tput cup $CRITICAL_LINE 0
    printf "                            "
    sleep 0.3
done
