#!/bin/bash

echo "Starting to process the command lines"

declare -a stuffOnTheCommandLine
debug="no"


while [ $# -gt 0 ]; do
  case "$1" in
    -h | --help)
      echo " $0 [-h | --help] "
      exit
      ;;
    -d )
      debug="Yes"
      echo "Debug is set to $debug"
      ;;
    * )
      stuffOnTheCommandLine+=("$1")

      # if [ "$filetoworkon" != ""  ];then
      #     echo "I don't know what '$1' means, exiting." >&2
      #     exit 2
      # else
      #     filetoworkon=$1
      # fi
      ;;
  esac

  # echo "Shifting..."
  shift
  # echo "
  #   There were $# arguments on the command line
  #   The first arguments was '$1'
  # "
done

for (( index=0; index -lt ${#stuffOnTheCommandLine[@]}; index++ ));
do
  echo "${stuffOnTheCommandLine[$index]}"
done



# echo "
# My command is '$0'
# There were $# arguments on the command line
# The first arguments was '$1'
# The second arguments was '$2'
# The third arguments was '$3'
# The fourth arguments was '$4'
# "
#
# while [ $# -gt 0 ]; do
#   echo "Shifting..."
#   shift
#
#   echo "
#   There were $# arguments on the command line
#   The first arguments was '$1'
#   "
# done


# read  -p "name ? " name
#
# while [ $name != "Alex" ]
# do
#   read  -p "another name ? " name
#   echo #
#   echo $
# done
