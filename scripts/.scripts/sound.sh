#!/bin/bash
if [ $1 = "down" ] ; then
	amixer -q -D pulse sset Master 5%- unmute
fi

if [ $1 = "up" ] ; then
	amixer -q -D pulse sset Master 5%+ unmute
fi

if [ $1 = "toggle" ] ; then
	amixer -q -D pulse sset Master toggle
fi
