#!/usr/bin/env bash

# Toggle layouts with both shift keys. Scroll
setxkbmap -option -option ctrl:nocaps,grp:shift_toggle,grp_led:scroll us,dk

# xmodmap must be called after setxkbmap, which apparently resets the modifications made with xmodmap.
xmodmap ~/.Xmodmap

xset r rate 250 40
