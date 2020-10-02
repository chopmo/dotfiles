#!/usr/bin/env bash

sleep 5
/usr/bin/import /home/jtj/Downloads/last-screenshot.png && xclip -selection clip -t image/png /home/jtj/Downloads/last-screenshot.png
