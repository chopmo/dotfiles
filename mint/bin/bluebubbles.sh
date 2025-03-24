#!/usr/bin/env bash
if [ `hostname` = "bau8" ]; then
  GDK_SCALE=2 flatpak run app.bluebubbles.BlueBubbles
else
  GDK_SCALE=1 flatpak run app.bluebubbles.BlueBubbles
fi
