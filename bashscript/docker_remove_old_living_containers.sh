#!/bin/bash
# Author:	Tien
# 
# Puppet Name: docker-remove-old-living-containers
# 45 17 * * * /usr/bin/docker ps | grep days | awk '{print $1}' | xargs --no-run-if-empty /usr/bin/docker rm -f > /dev/null

/usr/bin/docker ps | grep days | awk '{print $1}' | xargs --no-run-if-empty /usr/bin/docker rm -f > /dev/null
