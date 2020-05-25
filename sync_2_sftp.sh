#!/bin/bash

# Author:  Tien
# Date:    14/05/2020

# use cd to prevent the errot: No such file or directory
# use mput to put multiple file from local host to remote host
# 
# reference: 
# https://stackoverflow.com/questions/9349616/bash-eof-in-if-statement
# https://stackoverflow.com/questions/51782406/adding-shell-if-statement-inside-lftp
# https://stackoverflow.com/questions/17219416/how-to-use-a-linux-expect-script-to-enter-answer-a-prompt-for-password

hostname=$(echo $HOSTNAME)
dir=/home/unixadmin/config

lftp -u iot_user,7ytz1FlY sftp://iot_user@10.108.1.6:/home/DC1 << EOF
mkdir -p -f "$hostname"
cd /home/DC1/$hostname/
mput $dir/*
EOF
