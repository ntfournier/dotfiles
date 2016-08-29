#!/bin/bash
curr=$(cat /sys/class/backlight/intel_backlight/brightness)

if [ $1 = "down" ] ; then
  if [ $curr -gt "0" ] ; then
    down=$(( $curr-100 ))
    sudo tee /sys/class/backlight/intel_backlight/brightness <<< $down
  else
    echo "already min"
  fi
fi

if [ $1 = "up" ] ; then
  if [ $curr -lt "900" ] ; then
    up=$(( $curr+100 ))
    sudo tee /sys/class/backlight/intel_backlight/brightness <<< $up
  else
    echo "already max"
  fi
fi
