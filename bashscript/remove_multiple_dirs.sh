#!/bin/bash
# Author:	Tien
# Date:		11092021
# Purpose:	Remove multiple directories at the same time.

## declare an array variable
declare -a arr=("/var/lib/jenkins/jobs/dir1" "/var/lib/jenkins/jobs/dir2" "/var/lib/jenkins/jobs/dir3" "/var/lib/jenkins/jobs/dir4" "/var/lib/jenkins/jobs/dir5" "/var/lib/jenkins/jobs/dir6" "/var/lib/jenkins/jobs/dir7")

## now loop through the above array
for i in "${arr[@]}"
do
   cd "$i" && rm -f *
   # or do whatever with individual element of the array
done
