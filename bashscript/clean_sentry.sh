#!/bin/bash
# Author:	Tien
# Date:		06/07/2020
# Version:	1.0
# Purpose:	truncate sentry_eventmapping which is not impacted to Sentry operation - refer from Sentry community - this table only holds mappings for event ids to groups. This is usually ok compromise to reclaim a bunch of space
#
# Cronjob
# 12 7 * * * sudo -u postgres /var/lib/postgresql/clean_sentry.sh >> /tmp/output.log 2>&1

psql -d sentry -c "truncate table sentry_eventmapping"

