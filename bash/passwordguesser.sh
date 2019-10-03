#!/bin/bash
# This script demonstrates testing to see if 2 strings are the same

# TASK 1: Improve it by asking the user for a password guess instead of using inline literal data
# TASK 2: Improve it by rewriting it to use the if command
# TASK 3: Improve it by giving them 3 tries to get it right before failing (test 3 times but only if necessary)
#           *** Do not use the exit command

myString="TestString"
referenceString="password"

[ $myString = $referenceString ] && echo "You guessed the password!" || echo "The password eludes you..."

#Improve script
echo "=========Improve script============="

# TASK 1: Improve it by asking the user for a password guess instead of using inline literal data
read -p "Please input your password:" password

# TASK 2: Improve it by rewriting it to use the if command
if [ $password != $referenceString ];then
  echo "Sorry you put a wrong password"
fi

# TASK 3: Improve it by giving them 3 tries to get it right before failing (test 3 times but only if necessary)
i=1
while [ $i -le 3 ] && [ $password != $referenceString ];
do
  read -p "Please input your password ($i retry) :" password
  i=$((i+1))
done
