#!/bin/bash

## declare an array variable
declare -a arr=("/var/lib/jenkins/jobs/k8s-infra/jobs/k8s-infra-check-pipeline/builds/1/workflow/" "/var/lib/jenkins/jobs/k8s-infra/jobs/k8s-infra-check-pipeline/builds/2/workflow/" "/var/lib/jenkins/jobs/k8s-infra/jobs/k8s-infra-check-pipeline/builds/3/workflow/" "/var/lib/jenkins/jobs/k8s-infra/jobs/k8s-infra-check-pipeline/builds/4/workflow/" "/var/lib/jenkins/jobs/k8s-infra/jobs/k8s-infra-check-pipeline/builds/5/workflow/" "/var/lib/jenkins/jobs/k8s-infra/jobs/k8s-infra-check-pipeline/builds/6/workflow/" "/var/lib/jenkins/jobs/k8s-infra/jobs/k8s-infra-check-pipeline/builds/7/workflow/")

## now loop through the above array
for i in "${arr[@]}"
do
   cd "$i" && rm -f *
   # or do whatever with individual element of the array
done
