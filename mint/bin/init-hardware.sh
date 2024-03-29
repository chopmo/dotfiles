#/usr/bin/env bash
set -x

BASEDIR=$(dirname $0)

$BASEDIR/us-keyboard.sh
ruby $BASEDIR/init-monitors.rb

# Enable stereo output for SteelSeries headset
pacmd load-module module-alsa-sink device=hw:1,1

synclient VertScrollDelta=-114 MinSpeed=1.50 MaxSpeed=2.50 TapButton1=0 TapButton2=0

xinput --set-prop 9 "libinput Accel Speed" 0.5
