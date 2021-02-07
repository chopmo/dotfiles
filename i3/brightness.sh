#!/usr/bin/env bash

if [[ $1 == "up" ]]; then
  operation="+"
else
  operation="-"
fi

ddcutil setvcp --sleep-multiplier .1  --noverify 10 $operation 10
