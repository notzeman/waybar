#!/bin/bash

iface=$(ip route show default | awk '{print $5; exit}')

if [ -n "$iface" ]; then
  exec sudo nethogs "$iface"
else
  exec sudo nethogs -a
fi
