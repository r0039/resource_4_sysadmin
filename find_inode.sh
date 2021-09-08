#!/bin/bash 

find . -xdev -type f | cut -d "/" -f 2 | sort | uniq -c | sort -n
