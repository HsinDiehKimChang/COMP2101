#!/bin/bash
#
# This script produces the dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Improve this script by using the value in the automatic variable $USER for the name
# Improve this script by adding some time and day of the week information to the welcome message
#   Use a format like this:
#   It is HH:MM AM on weekday.

###############
# Variables   #
###############
title="Overlord"
myname="dennis"
hostname=$(hostname)

###############
# Main        #
###############
#cat <<EOF

#Welcome to planet $hostname, "$title $myname!"

#EOF

#Improve script
echo "=========Improve script============="

# using the value in the automatic variable $USER for the name
read -p "Please input your username:" USER
# Improve this script by adding some time and day of the week information to the welcome message
#   Use a format like this:
#   It is HH:MM AM on weekday.
HH=$(date +%H)
MM=$(date +%M)
APM=$(date +%p)
weekday=$(date +%A)


echo "Welcome to planet $USER!" |cowsay
