#!/usr/bin/env bash

killall -q xidlehook

# Run xidlehook
xidlehook \
  --not-when-fullscreen \
  --timer 600 \
    'i3lock -i ~/c/dotfiles/i3/images/bg1.png' \
    '' \
  --timer 120 \
    'xset dpms force suspend' \
    '' \
  &


# Not currently working because disabling SMT in the BIOS also breaks S3:
#  --timer 3600 \
#    'systemctl suspend' \
#    '' \
