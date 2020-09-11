#!/bin/bash

#AUTHOR:	Tien
#DATE:		05 of November, 2018
#PURPOSE:	it automatic runs the MySQL backup job every day and compresses it.
#VERSION:	0.1.5	Add command to create $HOSTNAME directory
#		0.1.7	Re-write script to make sure that's running on the fist Sunday of the month

for i in sunseap_portal_v1 sunseap_dlc sta_billing sptel_dlc solarpvx_v2 solarpvx skylab_tiot skylab_staff skylab_sso skylab_portal skylab_noc skylab_csp sbtest radius_sensors radius racktables powerdnsadmin performance_schema operation_center mysql mwc_dlc microservices inventory_management innologix_2 innologix icingaweb2 grafana gable_dlc dlc_vault dlc_staging dlc_multi_tenancy 3rd_reporting az_cfssl az_vault cfssl decada_demo dlc_billing_portal dlc_demo dlc_marketplace
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
