#!/usr/bin/env bash
setxkbmap -option -option ctrl:nocaps,grp_led:scroll dk
xmodmap -e "keycode 107 = Super_L"
xset r rate 250 40