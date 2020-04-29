#!/bin/bash

for i in $(kubectl get deployment | awk '{print $1}')
do
	kubectl scale --replicas=0 deployment/$i
done
