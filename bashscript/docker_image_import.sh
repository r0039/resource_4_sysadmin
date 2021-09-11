#!/bin/bash
# Author:	Tien
# Purpose:	Importing docker image

docker save docker_image:tag | bzip2 | ssh root@DESTINATION_IP 'bunzip2 | docker load'
