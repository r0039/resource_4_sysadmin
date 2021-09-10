#!/bin/bash 
# https://unix.stackexchange.com/questions/130899/finding-the-maximum-of-the-values-in-a-file 

# list all of inode 
find . -xdev -type f | cut -d "/" -f 2 | sort | uniq -c | sort -n

# list the top of inode 
find . -xdev -type f | cut -d "/" -f 2 | sort | uniq -c | sort -n | tail -1
