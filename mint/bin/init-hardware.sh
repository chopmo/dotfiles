#/usr/bin/env bash
set -x

BASEDIR=$(dirname $0)

$BASEDIR/init-keyboards.sh
ruby $BASEDIR/init-monitors.rb
