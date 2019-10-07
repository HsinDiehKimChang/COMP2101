#!/bin/bash

secret=$(( RANDOM % 10 +1))


for (( count=0;count < 4; count++ ))
do
  read -p "Pick a Number from 1 to 10 :" guess
  if [ "$guess" -lt $secret ];then
    echo "Too low"
  elif [ "$guess" -gt $secret ]; then
    echo "Too high"
  else
    echo "You Win!"
    break
  fi
done

echo "game over"

# for colours in red green blue 'darl yellow'; do
#   echo $colours
# done
