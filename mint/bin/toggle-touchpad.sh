#!/usr/bin/env bash

if synclient | grep "TouchpadOff.*0" > /dev/null; then
  synclient TouchpadOff=1;
else
  synclient TouchpadOff=0;
fi
