#!/usr/bin/env bash

/usr/bin/import /tmp/last_screenshot.png && xclip -selection clip -t image/png /tmp/last_screenshot.png
