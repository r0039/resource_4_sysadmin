#!/bin/bash

# Author: Tien
# Data:   05 March, 2020

url='dlc-integration.skylabteam.com'
echo | openssl s_client -servername $url -connect $url:443 2>/dev/null | openssl x509 -noout -dates
