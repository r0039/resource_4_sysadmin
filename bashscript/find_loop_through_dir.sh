#!/bin/bash
# Author:   Stackexchange 
# Source:   https://superuser.com/questions/363437/shell-scripting-loop-through-folders 

for file in $(find . -type f -name "*.csv"); do cat "$file" >> /path/to/output.csv; done

find . -name "*.txt" -exec cat '{}' >> /path/to/output.csv ';'

for dir in $(find . -type d); do find $dir -maxdepth 1 -name "*.csv" -exec cat {} >> "$dir/out" ';'; mv "$dir/out" "$dir/merged.csv"; done

for f in **/*.csv; do cat "$f" > merged_all.csv
