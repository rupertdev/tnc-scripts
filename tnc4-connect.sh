#!/bin/bash -e

function cleanup {
  echo "Releasing /dev/rfcomm0...."
  sudo rfcomm release /dev/rfcomm0
  sudo killall kissattach
}

trap cleanup EXIT

sudo rfcomm connect /dev/rfcomm0 34:81:F4:F6:0D:66 &
sleep 3
sudo kissattach -m 128 /dev/rfcomm0 wl2k

wait


