#!/bin/bash

# Before deleting the logs, if you have a huge one, a good practice is to keep the last 100 lines or so, and then delete it. 
# So, you can check what is happening after generating free space.
# If you just delete it with “rm” and the log file is being used by the PostgreSQL server (or another service) space won’t 
# be released, so you should truncate this file using this cat /dev/null command instead.

tail -100 /var/log/postgresql/postpostgresql-Fri.log > /tmp/log_temp.log
cat /dev/null > /var/log/postgresql/postpostgresql-Fri.log
