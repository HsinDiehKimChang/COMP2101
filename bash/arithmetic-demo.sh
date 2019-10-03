#!/bin/bash
#
# this script demonstrates doing arithmetic

# Improve this script by asking the user to supply the two numbers
# Improve this script by demonstrating using subtraction and multiplication
# Improve this script by demonstrating the modulus operation
#   - the output should look something like:
#   - first divided by second gives X with a remainder of Y
# Improve this script by calculating and displaying the first number raised to the power of the second number

firstnum=5
secondnum=2
sum=$((firstnum + secondnum))
dividend=$((firstnum / secondnum))
fpdividend=$(awk "BEGIN{printf \"%.2f\", $firstnum/$secondnum}")

cat <<EOF
$firstnum plus $secondnum is $sum
$firstnum divided by $secondnum is $dividend
  - More precisely, it is $fpdividend
EOF

#Improve script
echo "=========Improve script============="

# asking the user to supply the two numbers
read -p "Please input 1st number:" num1
read -p "Please input 2nd number:" num2

# demonstrating using subtraction and multiplication
subtraction=$(( $num1 - $num2))
multiplication=$(( $num1 * $num2))
cat << EOF
$num1 subtract $num2 is $subtraction
$num1 multiple $num2 is $multiplication
EOF

# demonstrating the modulus operation
#   - the output should look something like:
#   - first divided by second gives X with a remainder of Y
division=$(($num1 / $num2))
remainder=$(($num1 % $num2))

cat << EOF
$num1 divided by $num2 gives $division with a remainder $remainder
EOF

# calculating and displaying the first number raised to the power of the second number
power=$(($num1**$num2))
cat << EOF
$num1  raised to the power of  $num2 is $power
EOF
