#!/bin/bash


read -p "Gice me a colour to test: " colour

case "$colour" in
  "red" )
        echo "You chose red"
        ;;&
  "green" )
        echo "You chose green"
        ;;
  "red" | "yellow" )
        echo "You chose red or yellow"
        ;;
  * )
        echo "You didn't give me a colour I recognized, you chose '$colour' "
        ;;
esac

echo "End of Game"
