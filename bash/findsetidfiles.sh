#!/bin/bash
#
# this script generates a report of the files on the system that have the setuid permission bit turned on
# it is for the lab1 exercise

echo "Setuid files:"
echo "============="
find / -type f -executable -perm -4000 -ls 2>/dev/null | sort -k 3 | awk '{print $5,$3,$11}'
#
echo "============="

# Task 1 for the exercise is to modify it to also find and display the setgid files in a second listing
# The second listing should display after the setuid file list, and be formatted similar to the setuid file list

echo "Task 1:"
echo "Setuid files:"
echo "============="
find / -type f -executable -perm -2000 -ls 2>/dev/null | sort -k 3 | awk '{print $5,$3,$11}'
echo "============="

# Task 2 for the exercise is to modify it to also display the 10 largest files in the system, sorted by their sizes
# The listing should include the file name, owner, and size in MBytes and be displayed after the listings of setuid and setgid files

echo "Task 2:"
echo "10 largest files in the system:"
#ls / -S -R -l --block-size=M  2>/dev/null| grep -v '^total'|grep -v '/:'| head^C
#ls / -R  -lh  2>/dev/null |  sort -k 5 -n -r | head -n 10 | awk '{print $3,$1,$5/1024,"MB",$9}'
find / -type f  -ls  2>/dev/null | sort -k 7 -n -r| head -n 10 |awk '{print $5,$3,$7/1024/1024,"MB",$11}'
echo "============="
