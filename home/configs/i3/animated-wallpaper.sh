#! /usr/bin/env bash

WALLPAPER_VIDEO="/home/eien/dotfiles/animated-wallpaper.mp4"

if [ ! -f "$WALLPAPER_VIDEO" ]; then
  echo "Animated wallpaper file not found: $WALLPAPER_VIDEO" >&2
  feh --bg-fill /home/eien/dotfiles/wallpaper.jpg &
  exit 1
fi

pkill xwinwrap
pkill mpv

xwinwrap -fs -ov -ni -- \
  mpv --loop --no-audio --no-osc --no-border --quiet --no-terminal --vo=gpu --hwdec=auto \ -wid WID "$WALLPAPER_VIDEO" &
