#!/bin/bash
#xrandr --output HDMI-1 --auto --right-of DVI-D-1 --pos 2560x400 --output DVI-D-1 --auto --primary 

echo $1
if [ "$1" = 'philips'  ]; then
  xrandr --output DVI-I-1 --auto --primary --output DVI-D-1 --off
elif [ "$1" = 'dual' ]; then
  xrandr --output DVI-D-1 --auto --primary --output DVI-I-1 --auto --pos 2560x400
elif [ "$1" = 'tre' ]; then
  xrandr --output DVI-D-1 --auto --primary --pos 1920x0 --output DVI-I-1 --auto --pos 4480x400 --output HDMI-1 --auto --pos 0x400
fi

