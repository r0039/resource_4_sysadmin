#!/bin/bash

# Author: Tien
# Date:   06032020

# Now we have to send a SIGHUP signal to the Docker daemon so that it picks up the changes in the configuration file

sudo kill -SIGHUP $(pidof dockerd)

# Note that the preceding command only reloads the config file and does not restart the daemon

