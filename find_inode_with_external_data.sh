#!/bin/bash
# 
# cat $i to check the input is correct. 

FILES=/var/lib/jenkins/jobs/dir.txt


for i in `cat $FILES`
do
	cd $i
	find . -xdev -type f | cut -d "/" -f 2 | sort | uniq -c | sort -n | tail -1
done
