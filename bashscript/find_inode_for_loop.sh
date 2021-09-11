#!/bin/bash
# Author:	Tien
# Date: 	11102021
# Purpose:	Finding the top of inode on multiple directories of Jenkins

{
    for n in zuul terraform
    do
        cd /var/lib/jenkins/jobs/$n
        find . -xdev -type f | cut -d "/" -f 2 | sort | uniq -c | sort -n | tail -1
    done
} > top.log
