#!/bin/bash

# Author: Tien
# Date:   04/06/2020

# docker volume rm
/usr/bin/docker volume rm -f $(docker volume ls -q -f dangling=true)

# docker system prune
/usr/bin/docker system prune -f > /dev/null

# docker remove exited docker
/usr/bin/docker rm -v $(docker ps -a -q -f status=exited)
