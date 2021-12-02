#!/bin/sh

help(){
    echo
    echo
    echo "Sets a timer (in minutes) and minimises all windows once it's finished"
    echo "\t Usage: $(basename "$0") 2 "
    echo
}

if [ "$#" -eq 0 ]; then
    echo
    echo "ERROR : missing duration argument "
    help
    exit 1
fi

if [ "$1" = "-h" ]; then
    help
    exit 0
fi

re='^[0-9]+$'
if ! [ "$1" =~ $re ] ; then
    echo "only +ve ints supported"
    exit 1
else
    sleep $(( "$1"*60 ))
    osascript -e \
        "tell application \"System Events\" to keystroke \"h\" using {option down, command down}"
    osascript -e \
        "tell application \"System Events\" to keystroke \"m\" using {command down}"
fi

