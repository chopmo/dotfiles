#!/usr/bin/env bash
setxkbmap -option -option ctrl:nocaps,grp_led:scroll dk
xmodmap ~/.Xmodmap
xset r rate 250 40
