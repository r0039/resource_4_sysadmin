#!/bin/bash

#AUTHOR:	Tien
#DATE:		05 of November, 2018
#PURPOSE:	it automatic runs the MySQL backup job every day and compresses it.
#VERSION:	0.1.5	Add command to create $HOSTNAME directory
#		0.1.7	Re-write script to make sure that's running on the fist Sunday of the month

for i in db0 db1 db2 db3
do
        if [ `date +%d` -le 7 ]; then
                mkdir -p /home/azureuser/azureblob/$HOSTNAME/dump
                mysqldump -C $i > /home/azureuser/azureblob/$HOSTNAME/dump/$i.`date '+%Y%m%d_%H:%M:%S'`.sql.tgz
        else
                exit
        fi
done

#Delete file older than 120 days
find /home/azureuser/azureblob/$HOSTNAME/dump/ -type f -iname "*.tgz" -mtime +120 -exec rm -f {} \;
