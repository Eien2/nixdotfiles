#!/usr/bin/env bash

i3-msg -t subscribe -m '[ "window" ]' | while read -r line; do
  change=$(echo "$line" | jq -r '.change')
  container=$(echo "$line" | jq -r '.container')
  fullscreen=$(echo "$container" | jq -r '.fullscreen_mode')
  output=$(echo "$container" | jq -r '.output')

  if [ "$output" = 'DVI-D-0' ]; then
    if [ "$fullscreen" = '1' ]; then
      polybar-msg -p "$(pgrep -f 'polybar main1')" cmd quit
    elif [ "$change" = 'close' ] || [ "$change" = 'focus' ]  || [ "$change" = 'fullscreen_mode' ]; then
        killall polybar
        polybar main1 & disown
    fi
  else
    if [ "$fullscreen" = '1' ]; then
      polybar-msg -p "$(pgrep -f 'polybar main2')" cmd quit
    elif [ "$change" = 'close' ] || [ "$change" = 'focus' ] || [ "$change" = 'fullscreen_mode' ]; then
      killall polybar
      polybar main2 & disown
    fi
  fi
done

  
