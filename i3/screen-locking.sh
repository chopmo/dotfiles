#!/usr/bin/env bash

killall -q xidlehook

# Run xidlehook
xidlehook \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  `#--not-when-audio` \
  `# Dim the screen after 60 seconds, undim if user becomes active` \
  --timer 300 \
    'i3lock -i ~/c/dotfiles/i3/images/bg1.png' \
    '' \
  `# Undim & lock after 10 more seconds` \
  --timer 300 \
    'xset dpms force suspend' \
    '' \
  `# turn off screen` \
  --timer 3600 \
    'systemctl suspend' \
    '' \
  &
