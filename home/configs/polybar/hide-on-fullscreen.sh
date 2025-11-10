#!/usr/bin/env bash

i3-msg -t subscribe -m '[ "window" ]' | while read -r line; do
  container=$(echo "$line" | jq -r '.container')
  fullscreen=$(echo "$container" | jq -r '.fullscreen_mode')
  output=$(echo "$container" | jq -r '.output')

  if [ "$output" = 'DVI-D-0' ]; then
    if [ "$fullscreen" = '1' ]; then
      polybar-msg -p "$(pgrep -f 'polybar main1')" cmd hide
    else
      polybar-msg -p "$(pgrep -f 'polybar main1')" cmd show
    fi
  else
    if [ "$fullscreen" = '1' ]; then
      polybar-msg -p "$(pgrep -f 'polybar main2')" cmd hide
    else
      polybar-msg -p "$(pgrep -f 'polybar main2')" cmd show
    fi
  fi
done
