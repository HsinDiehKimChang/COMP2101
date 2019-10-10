#!/bin/bash

declare -a interface

for tmp in $(nmcli device status | awk '{print$1}');do
  if [ $tmp != "DEVICE" ] && [ $tmp != "lo"  ];then
    interface+=($tmp)
  fi
done

#echo $interface

for (( i=0;i < ${#interface[@]}; i++ ));do
    echo "$i ${interface[$i]}  "
done


# secret=$(( RANDOM % 10 +1))
#
#
# for (( count=0;count < 4; count++ ))
# do
#   read -p "Pick a Number from 1 to 10 :" guess
#   if [ "$guess" -lt $secret ];then
#     echo "Too low"
#   elif [ "$guess" -gt $secret ]; then
#     echo "Too high"
#   else
#     echo "You Win!"
#     break
#   fi
# done
#
# echo "game over"

# for colours in red green blue 'darl yellow'; do
#   echo $colours
# done
