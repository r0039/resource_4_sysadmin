#!/bin/bash
local_registry=registry.iot.internal
dlc_version=2.0.0-rc3
declare -a images
images[0]=registry.innogr.am/dlc-customer-portal:${dlc_version}
images[1]=registry.innogr.am/dlc-devices-api:${dlc_version}
images[2]=registry.innogr.am/dlc-certificates-api:${dlc_version}
images[3]=registry.innogr.am/dlc-consumers:${dlc_version}
images[4]=registry.innogr.am/dlc-event-logs:${dlc_version}
images[5]=registry.innogr.am/dlc-message-processor:${dlc_version}
images[6]=registry.innogr.am/dlc-slas-api:${dlc_version}
images[7]=registry.innogr.am/dlc-device-status:${dlc_version}
images[8]=registry.innogr.am/dlc-portal:${dlc_version}
images[9]=registry.innogr.am/dlc-acl-api:${dlc_version}
images[10]=registry.innogr.am/dlc-alert-processor:${dlc_version}
images[11]=registry.innogr.am/dlc-apps-api:${dlc_version}
images[12]=registry.innogr.am/dlc-k8s-deployment-api:${dlc_version}
images[13]=registry.innogr.am/dlc-destinations-api:${dlc_version}
images[14]=registry.innogr.am/dlc-audit-log-processor:${dlc_version}
images[15]=registry.innogr.am/dlc-audit-logs:${dlc_version}
images[16]=registry.innogr.am/dlc-device-configurations:${dlc_version}
images[17]=registry.innogr.am/dlc-device-logs-api:${dlc_version}
images[18]=registry.innogr.am/dlc-message-delivery:${dlc_version}
images[19]=registry.innogr.am/dlc-message-delivery-processor:${dlc_version}
images[20]=registry.innogr.am/dlc-firmware-api:${dlc_version}
images[21]=registry.innogr.am/dlc-locations-api:${dlc_version}
images[22]=registry.innogr.am/dlc-marketplace-handle-response-job:${dlc_version}
images[23]=registry.innogr.am/dlc-k8s-node-pool-api:${dlc_version}
images[24]=registry.innogr.am/dlc-notifications-api:${dlc_version}
images[25]=registry.innogr.am/dlc-notifications-processor:${dlc_version}
images[26]=registry.innogr.am/dlc-roles-api:${dlc_version}
images[27]=registry.innogr.am/dlc-second-factor:${dlc_version}
images[28]=registry.innogr.am/dlc-users-api:${dlc_version}
images[29]=registry.innogr.am/dlc-sidekiq-scheduler:${dlc_version}
images[30]=registry.innogr.am/dlc-sla-groups-api:${dlc_version}
images[31]=registry.innogr.am/dlc-slas:${dlc_version}
images[32]=registry.innogr.am/dlc-sptel-apis:${dlc_version}
images[33]=registry.innogr.am/dlc-statistics-api:${dlc_version}
images[34]=registry.innogr.am/dlc-sync-kong-processor:${dlc_version}
images[35]=registry.innogr.am/dlc-device-logs:${dlc_version}
images[36]=registry.innogr.am/dlc-kafka-worker:${dlc_version}
images[37]=registry.innogr.am/emqtt:${dlc_version}
images[38]=registry.innogr.am/mqtt-lb:${dlc_version}
images[39]=registry.innogr.am/cfssl:${dlc_version}
images[40]=registry.innogr.am/vault:${dlc_version}
images[41]=registry.innogr.am/kong:${dlc_version}
images[42]=registry.innogr.am/kong-ingress-controller:${dlc_version}
images[43]=registry.innogr.am/pgbi-kong-dashboard:latest
images[44]=registry.innogr.am/dlc-repository-api:${dlc_version}
images[45]=registry.innogr.am/dlc-repository-worker:${dlc_version}
images[46]=registry.innogr.am/sptel-dlc-app-deployment-api:${dlc_version}
images[47]=registry.innogr.am/dlc-services-health-check:${dlc_version}
images[48]=registry.innogr.am/prometheus-kafka-adapter:1.3.0
declare -a emma_images
### Pull Docker Image
# Login to Docker Registry
docker login -u skylab -p YmnNUPRKyNub registry.innogr.am
echo ">>>> Pull Docker Images"
for i in "${!images[@]}"
 do
   docker pull "${images[i]}"
   IFS='/'
   read -ra ADDR <<< "${images[i]}"
   IFS=':'
   read -ra ADDR <<< "${ADDR[1]}"
   emma_image="${local_registry}/${ADDR[0]}:${dlc_version}"
   echo "$emma_image"
   docker tag "${images[i]}" "$emma_image"
   # docker rmi "${images[i]}"
   emma_images[$i]="$emma_image"
 done
### Push Docker Image
# Login to Docker Registry
docker login -u admin -p eEprX0OPuykg "$local_registry"
echo ">>>> Push Docker Images"
for i in "${!emma_images[@]}"
 do
   echo "${emma_images[i]}"
   docker push "${emma_images[i]}"
   # docker rmi "${emma_images[i]}"
 done
