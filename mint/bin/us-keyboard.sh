#!/usr/bin/env bash

setxkbmap -option -option ctrl:nocaps -option compose:ralt us

# TODO: What was this?
#

# Map (in order):
# - caps lock key to control
# - left ctrl key to Mode_switch
# - Semicolon key to support ae with Mode_switch
# - Apostrophe key to support oslash with Mode_switch
# - Bracketleft key to support aring with Mode_switch
# - PrtSc on Thinkpad to Super L
xmodmap -e "keycode 66 = Control_L NoSymbol Control_L" \
        -e "keycode 37 = Mode_switch NoSymbol Mode_switch" \
        -e "keycode 47 = semicolon colon ae AE" \
        -e "keycode 48 = apostrophe quotedbl oslash Oslash" \
        -e "keycode 34 = bracketleft braceleft aring Aring" \
        -e "keycode 107 = Super_L" \
        -e "keycode 108 = Super_L"

xset r rate 200 40
