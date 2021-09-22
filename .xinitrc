#!/bin/sh 

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

xinput set-prop 11 341 1 &
xinput set-prop 11 321 1 &

exec xmonad
