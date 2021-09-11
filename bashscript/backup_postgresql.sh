#!/bin/bash
#AUTHOR:	Tien
#DATE:		06 of May, 2019
#PURPOSE:	backup the entire Postgres SQL.
#VERSION:	0.1	Simple logical backup

mkdir -p /home/azureuser/azureblob/$HOSTNAME/
sudo su - postgres psql -c "pg_dumpall -f /home/azureuser/azureblob/ops2/file.`date '+%Y%m%d_%H:%M:%S'`.sql"

# Data Retention
find /home/azureuser/azureblob/$HOSTNAME/ -mtime +180 -exec rm -rf {} \;
