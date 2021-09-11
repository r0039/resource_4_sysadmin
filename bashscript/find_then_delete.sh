#!/bin/bash
# Author:     Tien

# Using for loop 
for i in $(find /tmp -name '*.txt' -or -name '*.log'); do rm $i; done 

# Using --delete of find 
find /tmp \( -name '*.txt' -or -name '*.log' \) -delete

# Using --delete of find for file type 
find /tmp \( -name "*.txt" -o -name "*.log" \) -type f -delete

# Using stdout with xargs 
find /tmp -name '*.txt' -or -name '*.log' | xargs rm

# Using stdout with exec 
find /tmp \( -name "*.txt" -o -name "*.log" \) -type f -exec rm {} +
