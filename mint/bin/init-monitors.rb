#!/usr/bin/env ruby

# Something like:
# If HDMI is connected, turn that on and make it primary
# If lid is open, also enable eDP1 left of HDMI, otherwise turn that off
# Notify with notify-send (maybe?)
# cat /proc/acpi/button/lid/LID/state

# Dual monitor setup: xrandr --output eDP1 --left-of DP1-1 --mode 1920x1080 --output DP1-1 --primary --mode 2560x1440

if `xrandr`[/DP1-1 connected/]
  `xrandr --output DP1-1 --primary --mode 3440x1440`
  `xrandr --output eDP1 --off`
  `notify-send "Selected DP1-1"`
elsif `xrandr`[/DP1-2 connected/]
  `xrandr --output DP1-2 --primary --mode 3440x1440`
  `xrandr --output eDP1 --off`
  `notify-send "Selected DP1-2"`
else
  `xrandr --output eDP1 --primary --mode 1920x1080`
  `notify-send "Selected eDP1"`
end
