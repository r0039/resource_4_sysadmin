#!/bin/bash

tail -100 /var/log/postgresql/postpostgresql-Fri.log > /tmp/log_temp.log
cat /dev/null > /var/log/postgresql/postpostgresql-Fri.log
