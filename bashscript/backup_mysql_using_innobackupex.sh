#!/bin/bash

#FILE		./innobackupex.sh
#AUTHOR		tien.phan
#DATE		06 of November, 2018
#VERSION	0.1	first draff 20181107
#		0.2	second draff 20181108
#		0.2.1	release version
#		0.2.2	change the backup location to AWS S3 (mounted by s3fs)
#		0.2.3   add feature "delete file older than 30 days
#		0.2.4	add $HOSTNAME & echo timestamp for [start/ finish] job
#		0.2.5	change the schedule of backup. Also change /data/s3mysqlbackup to /s3mysqlbackup
#		0.2.7	add "--slave-info" to manage replication info (CHANGE MASTER HOST ...), and replace $DATABASE by listing exactly databases name at shell.
#		0.2.7.1 fixed issue: Failed to connect to MySQL server. Access deinied for user 'root'@'localhost'. Innobackupex could not read the credentails at ~/.my.cnf
#		0.2.8	add feature: delete S3FS caching
#               0.2.8.1 fixed issue: typo in incremental command (extra spaces). From "--incremental-basedir =" to "--incremental-basedir="

#HOW IT WORKS
#On Saturday, it runs full backup
#On Sunday, it runs incremental as base full backup of Monday
#From Monday to Friday, it runs incremental as base incremental of Tuedays. The same action for Thurday, Friday, Sartuday and Sunday

#VARIABLES
BACKUP_DATE=`date +%Y%m%d`
YESTERDAY=$((BACKUP_DATE -1))
TODAY=$(LC_TIME=C date +%A)
LOG="/var/log/xtrabackup.log"
PWD=`cat /etc/mysqlpwd`

#SCRIPT RUNS
if [ "$TODAY" = "Saturday" ]
then
	echo "Start to backup at `date`" >> $LOG
	mkdir -p /home/azureuser/azureblob/$HOSTNAME/full/"$BACKUP_DATE"
	innobackupex --user=root --password=$PWD --slave-info --compress --no-timestamp --databases ="db00 db01 db02 information_schema performance_schema sys" /home/azureuser/azureblob/"$HOSTNAME"/full/"$BACKUP_DATE"/
	echo "Full backup was completed at `date`" >> $LOG
elif [ "$TODAY" = "Sunday" ]
then
	echo "Start to backup at `date`" >> $LOG
	mkdir -p /home/azureuser/azureblob/"$HOSTNAME"/incremental/"$BACKUP_DATE"
	innobackupex --user=root --password=$PWD --slave-info --compress --no-timestamp --databases="db00 db01 db02 information_schema performance_schema sys" --incremental /home/azureuser/azureblob/"$HOSTNAME"/incremental/"$BACKUP_DATE" --incremental-basedir=/home/azureuser/azureblob/"$HOSTNAME"/full/"$YESTERDAY"/
	echo "Incremental backup was completed at `date`" >> $LOG
else
	echo "Start to backup at `date`" >> $LOG
	mkdir -p /home/azureuser/azureblob/"$HOSTNAME"/incremental/"$BACKUP_DATE"
	innobackupex --user=root --password=$PWD --slave-info --compress --no-timestamp --databases="db00 db01 db02 information_schema performance_schema sys" --incremental /home/azureuser/azureblob/"$HOSTNAME"/incremental/"$BACKUP_DATE" --incremental-basedir=/home/azureuser/azureblob/"$HOSTNAME"/incremental/"$YESTERDAY"/
	echo "Incremental backup was completed at `date`" >> $LOG
fi

#DELETE S3FS CACHING
#rm -rf /tmp/s3cache/skylab-mysql-backup

#DELETE FILE OLDER THAN 60 DAYS
find /home/azureuser/azureblob/$HOSTNAME/full/ -mtime +60 -exec rm -rf {} \;
find /home/azureuser/azureblob/$HOSTNAME/incremental/ -mtime +60 -exec rm -rf {} \;
