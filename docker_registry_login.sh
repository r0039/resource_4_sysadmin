#!/bin/bash

cat ~/gooddata_registry_pass.txt | docker login --username gdc --password-stdin https://registry.anywhere.gooddata.com/
