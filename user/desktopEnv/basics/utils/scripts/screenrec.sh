#!/bin/sh

SRPID=$(pgrep wl-screenrec)

if [[ -z $SRPID ]];
then
    wl-screenrec -g "$(slurp)"
else
    kill $SRPID
    notify-send "Recording saved" -t 2000
fi
