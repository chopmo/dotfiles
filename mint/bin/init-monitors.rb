#!/usr/bin/env ruby

# Something like:
# If HDMI is connected, turn that on and make it primary
# If lid is open, also enable eDP1 left of HDMI, otherwise turn that off
# Notify with notify-send (maybe?)
# cat /proc/acpi/button/lid/LID/state

# Dual monitor setup: xrandr --output eDP1 --left-of DP1-1 --mode 1920x1080 --output DP1-1 --primary --mode 2560x1440

if `xrandr`[/HDMI-0 connected/]
  `xrandr --output HDMI-0 --primary --mode 3440x1440`
  `notify-send "Selected HDMI-0"`
end
