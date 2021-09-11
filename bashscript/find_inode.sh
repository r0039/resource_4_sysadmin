#!/bin/bash
# Author:	Tien
# Purpose:	Find the consuming inode 
# https://unix.stackexchange.com/questions/130899/finding-the-maximum-of-the-values-in-a-file 
# use head -1 for getting the first one
# use tail -1 for getting the last one

# show all inode
find . -xdev -type f | cut -d "/" -f 2 | sort | uniq -c | sort -n

# show the last one inode
find . -xdev -type f | cut -d "/" -f 2 | sort | uniq -c | sort -n | tail -1
