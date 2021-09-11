#!/bin/bash
# Author:	Tien
# Date:		11092021 
# cat $i to check the input is correct. 
# 
# You must have the dir_list.txt file at the same place to run script.

FILES=/var/lib/jenkins/jobs/dir_list.txt

for i in `cat $FILES`
do
	cd $i
	find . -xdev -type f | cut -d "/" -f 2 | sort | uniq -c | sort -n | tail -1
done
