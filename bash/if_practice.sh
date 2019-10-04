#!/bin/bash

read -p "number? " x

if [ $x -gt 100 ]
then
  echo "too high"

elif [ $x -lt 100 ]
then
  echo "too low"
else
  echo "Equal!"
fi
