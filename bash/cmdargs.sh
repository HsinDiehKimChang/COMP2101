#!/bin/bash
# This script demonstrates how the shift command works

echo "======Modify by Hsin-Dieh Chang======"

# loop through the command line arguments
while [ $# -gt 0 ]; do
    echo "Processing '$1'."
  # tell the user how many things are left on the command line
  #echo "There are $# things left to process on the command line."
  # display whatever is in $1
  #echo '$1 has '"''$1' in it."

# TASK 1: replace the echo command that just says processing with a case statement that
#             recognizes the following command line options and tells the user if
#             they were found on the command line
#          Options to recognize: -h for help, -v for verbose mode
    case "$1" in
      -h | --help)
        echo "Help mode "
        ;;
      -v | --verbose )
        echo "Verbose Mode"
        ;;
# TASK 2: add recognition of a debug option -d that expects a number that specifies the debug level (e.g. -d 3)
#             save the debug level in a variable to be available to use later in the script
#             display an error if the user gave the -d option without a number after it
      -d | --debug  )
        if [ -z "$2" ];then
          echo "Error : gave the -d option without a number "
          exit
        fi
        if [ -n "$2" ] && [ -z ${2//[0-9]}  ] ; then
          echo "your debug level is $2"
        else
          echo "Error : debug level can only be a number "
          exit
        fi
        ;;
# TASK 3: put anything that wasn't recognized on the command line into a variable for use later in the script
      * )
        echo "Can not recognized your command: $1"

        # if [ "$filetoworkon" != ""  ];then
        #     echo "I don't know what '$1' means, exiting." >&2
        #     exit 2
        # else
        #     filetoworkon=$1
        # fi
        ;;
    esac

  # each time through the loop, shift the arguments left
  # this decrements the argument count for us
  shift
  # tell the user we shifted things
  echo "Shifted command line, leaving $# things left to process."
  echo "--------------------------"
  # go back to the top of the loop to see if anything is left to work on
done
echo "Done"
