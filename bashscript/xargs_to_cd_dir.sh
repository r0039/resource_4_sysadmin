#!/bin/bash
# Author:   Tien

ls | xargs -L 1 bash -c 'cd "$0" && ls'
