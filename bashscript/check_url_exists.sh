#!/bin/bash
# Author:	Tien
# Purpose:	Check the URL existing or not
#
# --fail will make the exit status nonzero on a failed request
# --head will avoid downloading the file contents, since we don't need it for this check
# --silent will avoid status or errors from being emitted by the check itself.
#
# If your server refuses HEAD requests, an alternative is to request only the first byte of the file
# if curl --output /dev/null --silent --fail -r 0-0 "$url"; then
#
# if wget --spider http://google.com 2>/dev/null; then
#  echo "File exists"
# else
#  echo "File does not exist"
# fi
#
# --spider option makes wget just check for the file instead of downloading it
# 2> /dev/null silences wget's stderr output
#

url="https://google.com"

if curl --output /dev/null --silent --head --fail "$url"; then
  echo "URL exists: $url"
else
  echo "URL does not exist: $url"
fi
