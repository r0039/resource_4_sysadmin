#!/bin/bash

var=$(date +"%FORMAT_STRING")
now=$(date +"%m_%d_%Y")
today=$(date +"%Y-%m-%d")

BACKUP_DIR="/data/backup"
INFLUXDB_DATA_DIR="/data/docker/volumes/cb43350ccca03171e58ce7e62ca1f1d2956dad15f3b55e87d4ed24ab30e82fd6"
INFLUXDB_BACKUP_PATH="${BACKUP_DIR}/travis_influxdb_${today}.tar.gz"

printf "Doing Influxdb full backup at ${INFLUXDB_BACKUP_PATH}"
cd $INFLUXDB_DATA_DIR && tar czf $INFLUXDB_BACKUP_PATH _data

printf "Copying the backup to Google Drive..."
rclone copy $INFLUXDB_BACKUP_PATH gdrive:travis

printf "DONE!"
