#!/usr/bin/env bash

i3-msg -t subscribe -m '[ "window" ]' | while read -r line; do
  container=$(echo "$line" | jq -r '.container')
  fullscreen=$(echo "$container" | jq -r '.fullscreen_mode')

  # Upgrade it so it only shows or hide the polybar on this screen when it is fullscreened
  if [ "$fullscreen" = '1' ]; then
    polybar-msg cmd hide
  else
    polybar-msg cmd show
  fi
done
