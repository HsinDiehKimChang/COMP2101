#!/bin/bash

read  -p "name ? " name

while [ $name != "Alex" ]
do
  read  -p "another name ? " name
  echo #
  echo $
done
