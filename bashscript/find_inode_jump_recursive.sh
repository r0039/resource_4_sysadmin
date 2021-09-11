#!/bin/bash
# Author:   Tien
# Date:     11092021
# Purpose:  find the consuming inode. 
# Idea:     Set the number of recursive, then run the script, it will jump to `number-of-recursive` to find the consuming inode. 

for i in /Documents/* /Documents/**/* /Documents/**/**/*
do
        find $i -xdev -type f | cut -d "/" -f 2 | sort | uniq -c | sort -n | tail -1
done
