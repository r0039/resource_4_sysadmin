#!/bin/bash
# Author: Tien
# Date:   05032020
#docker ps | grep quotes | awk '{print $1}'

docker stop $(docker ps | grep quotes | awk '{print $1}')
