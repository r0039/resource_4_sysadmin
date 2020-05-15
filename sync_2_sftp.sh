#!/bin/bash

# Author:  Tien
# Date:    14/05/2020

# use cd to prevent the errot: No such file or directory
# use mput to put multiple file from local host to remote host

hostname=$(echo $HOSTNAME)
dir=/home/unixadmin/config

lftp -u iot_user,7ytz1FlY sftp://iot_user@10.108.1.6:/home/DC1 << EOF
mkdir -p -f "$hostname"
cd /home/DC1/$hostname/
mput $dir/*
EOF
