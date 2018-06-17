#!/usr/bin/env bash

if xrandr -d :0 | grep "HDMI1 connected"; then
  logger "Lid closed but HDMI connected, so not suspending"
else
  logger "Lid closed, suspending"
  # systemctl suspend
fi
