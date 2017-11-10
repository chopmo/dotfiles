#!/usr/bin/env ruby

# Something like:
# If HDMI is connected, turn that on and make it primary
# If lid is open, also enable eDP1 left of HDMI, otherwise turn that off
# Notify with notify-send (maybe?)
# cat /proc/acpi/button/lid/LID/state

if `xrandr`[/HDMI1 connected/]
  `xrandr --output HDMI1 --primary --mode 2560x1440`
  `xrandr --output eDP1 --off`
  `notify-send "Selected HDMI1"`
else
  `xrandr --auto`
  `notify-send "Selected auto"`
end
