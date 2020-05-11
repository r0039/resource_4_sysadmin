#!/bin/bash

for i in $(kubectl get deployment | awk '{print $1}')
do
	kubectl scale --replicas=0 deployment/$i
done

##############################################################################################################################
# So, like others have pointed out, Kubernetes doesn't support stop/pause of current state of pod and resume when needed.    #
# However, you can still achieve it by having no working deployments which is setting number of replicas to 0.               #
#        														     #
# kubectl scale --replicas=0 deployment/<your-pod>                                     					     #
#           														     #
# Set a new size for a Deployment, ReplicaSet, Replication Controller, or StatefulSet.			                     #
# kubectl scale --help													     # 
# Scale also allows users to specify one or more preconditions for the scale action.					     #
# 														             #
# If --current-replicas or --resource-version is specified, it is validated before the scale is attempted, and it is         #
# guaranteed that the precondition holds true when the scale is sent to the server.					     #
# 															     #
# Scale a replicaset named 'foo' to 3.									                     #
#  kubectl scale --replicas=3 rs/foo										             #
#														             #
# Scale a resource identified by type and name specified in "foo.yaml" to 3.						     #
#  kubectl scale --replicas=3 -f foo.yaml									             #
#															     #
#  If the deployment named mysql's current size is 2, scale mysql to 3.							     #
#  kubectl scale --current-replicas=2 --replicas=3 deployment/mysql							     #
#															     #
#  Scale multiple replication controllers.										     #
#  kubectl scale --replicas=5 rc/foo rc/bar rc/baz									     #
#															     #
#  Scale statefulset named 'web' to 3.											     #
#  kubectl scale --replicas=3 statefulset/web										     #
##############################################################################################################################

# reference: https://stackoverflow.com/questions/54821044/how-to-stop-pause-a-pod-in-kubernetes
