#!/bin/bash
# Reference 
# https://www.delftstack.com/howto/linux/remove-file-extension-using-shell/

dir = "your_dir"
ls -A1 $dir > /tmp/output.txt
cut -f 1 -d '.' /tmp/output.txt > /tmp/final_output.txt
