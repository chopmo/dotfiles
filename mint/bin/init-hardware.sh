#/usr/bin/env bash
set -x

BASEDIR=$(dirname $0)

# Map copilot scancode to F23 to allow me to remap it with keyd
# Requires this line in /etc/keyd/default.conf:
# leftshift+leftmeta+f23 = overload(meta, noop)
/usr/bin/setkeycodes 6e 193

$BASEDIR/us-keyboard.sh
ruby $BASEDIR/init-monitors.rb

# Enable stereo output for SteelSeries headset
pacmd load-module module-alsa-sink device=hw:1,1

synclient VertScrollDelta=-114 MinSpeed=1.50 MaxSpeed=2.50 TapButton1=0 TapButton2=0

