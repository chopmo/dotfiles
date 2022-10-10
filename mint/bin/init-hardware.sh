#/usr/bin/env bash
set -x

BASEDIR=$(dirname $0)

$BASEDIR/us-keyboard.sh
# ruby $BASEDIR/init-monitors.rb

# Enable stereo output for SteelSeries headset
pacmd load-module module-alsa-sink device=hw:1,1

synclient VertScrollDelta=-114 MinSpeed=1.50 MaxSpeed=2.50 TapButton1=0 TapButton2=0

if [[ $HOSTNAME = "bau7" ]]; then
  xrandr --output HDMI-0 --primary --mode 3440x1440
  notify-send "Hardware init done"
else
  xrandr --output eDP-1 --primary
  # ruby $BASEDIR/init-monitors.rb
  pkill dunst
fi

# Enable natural scrolling
#
# Source https://github.com/maxwell-bland/i3-natural-scrolling-and-tap/blob/master/inverse-scroll.sh
# id=`xinput list | grep "Synaptic" | cut -d'=' -f2 | cut -d'[' -f1`
# natural_scrolling_id=`xinput list-props $id | \
#                       grep "Natural Scrolling Enabled (" \
#                       | cut -d'(' -f2 | cut -d')' -f1`
# xinput --set-prop $id $natural_scrolling_id 1

# Kill dunst so it will recalculate screen position on next
# notification, because screen size may have changed.
#

xinput --set-prop 9 "libinput Accel Speed" 0.5
