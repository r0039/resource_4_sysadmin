#!/bin/bash
# Author:         Tien
# Source:         https://stackoverflow.com/questions/8880603/loop-through-an-array-of-strings-in-bash 

## declare an array variable
declare -a arr=("/var/lib/jenkins/jobs/dir0" "/var/lib/jenkins/jobs/dir1" "/var/lib/jenkins/jobs/dir2" "/var/lib/jenkins/jobs/dir3" "/var/lib/jenkins/jobs/dir4" "/var/lib/jenkins/jobs/dir5" "/var/lib/jenkins/jobs/dir6")

## now loop through the above array
for i in "${arr[@]}"
do
   cd "$i" && rm -f *
   # or do whatever with individual element of the array
done
