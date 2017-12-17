#!/usr/bin/env bash
/usr/bin/import /tmp/last-screenshot.png && xclip -selection clip -t image/png /tmp/last-screenshot.png
