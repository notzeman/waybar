#!/bin/bash

devices=$(bluetoothctl devices Connected | awk '{print $2}')

if [ -z "$devices" ]; then
  echo "No devices connected"
  exit 0
fi

for dev in $devices; do
  info=$(bluetoothctl info "$dev")

  name=$(echo "$info" | grep "Name:" | cut -d ' ' -f2-)
  raw=$(echo "$info" | grep -i "Battery Percentage" | awk '{print $3}')

  if [ -z "$raw" ]; then
    echo "$name: N/A"
  else
    # Convert hex (0x..) to decimal if needed
    if [[ "$raw" == 0x* ]]; then
      battery=$((raw))
    else
      battery="$raw"
    fi
    echo "$name: $battery%"
  fi
done
