#!/bin/sh

volumeicon &

# Launch cbatticon only if there is a battery
[[ $(ls /sys/class/power_supply/) == "" ]] || cbatticon -i symbolic &
