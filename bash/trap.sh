#!/bin/bash

#
function ctrlC {
  echo "Cannot stop"
  count=5
}

function ctrl {
  echo "You found the secretto getting out of the script"
  exit 1
}


for (( count=5;count > 0; count-- ))
do
  echo "$count"
  trap ctrlC SIGINT
  trap ctrl SIGQUIT
  sleep 1
done
