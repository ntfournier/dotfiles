#!/bin/bash
curr=$(cat /sys/class/leds/asus\:\:kbd_backlight/brightness)

if [ $1 = "down" ] ; then
  if [ $curr -gt "0" ] ; then
    down=$(( $curr-1 ))
    sudo tee /sys/class/leds/asus\:\:kbd_backlight/brightness <<< $down
  else
    echo "already min"
  fi
fi

if [ $1 = "up" ] ; then
  if [ $curr -lt "3" ] ; then
    up=$(( $curr+1 ))
    sudo tee /sys/class/leds/asus\:\:kbd_backlight/brightness <<< $up
  else
    echo "already max"
  fi
fi
