#!/bin/bash
#
# this script rolls a pair of six-sided dice and displays both the rolls and the sum
#

# Improve this script by re-organizing it to:
#  put the number of sides in a variable which is used as the range for the random number
#  put the bias, or offset, for the RANDOM number in a variable (it is 1 for our purposes)
#     - you can think of this as the minimum value for the generated number
#  roll the dice using the variables for the range and bias i.e. RANDOM % range + bias
#  generate the sum of the dice
#  generate the average of the dice
#  display a summary of what was rolled, and what the result was

# Tell the user we have started processing
echo "Rolling..."
# roll the dice and save the results
die1=$(( RANDOM % 6 + 1))
die2=$(( RANDOM % 6 + 1 ))
# sum up the rolls
sum=$(( die1 + die2 ))
# display the results
echo "Rolled $die1, $die2 for a $sum"

#Improve script
echo "=========Improve script============="


# Improve this script by re-organizing it to:
#  put the number of sides in a variable which is used as the range for the random number
sides=15
echo "Rolling 2 $sides dice"
# roll the dice and save the results
nDie1=$(( RANDOM % $sides + 1))
nDie2=$(( RANDOM % $sides + 1 ))
# sum up the rolls
nSum=$(( $nDie1 + $nDie2 ))
nAvg=$(($nSum / 2))

# display the results
echo "the sum of the dice : $nSum"
echo "the average of the dice is about: $nAvg"
echo "Rolled $nDie1, $nDie2"
