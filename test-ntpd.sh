#!/bin/bash -x

#Test NTP
#From any machine that has ntpdate you can query your new NTP container with the follow command:

MY_IP=`ip route get 1|awk '{print$NF;exit;}'`

ORGANIZATION=openkbs
DOCKER_IMAGE_REPO=`echo $(basename $PWD)|tr '[:upper:]' '[:lower:]'|tr "/: " "_" `
imageTag=${1:-"${ORGANIZATION}/${DOCKER_IMAGE_REPO}"}
instanceName=`echo $(basename ${imageTag})|tr '[:upper:]' '[:lower:]'|tr "/: " "_"`

ntpdate -q ${MY_IP}

# Here is a sample output from my environment:

#ntpdate -q 10.13.13.9
#server 10.13.13.9, stratum 3, offset 0.010089, delay 0.02585
#17 Sep 15:20:52 ntpdate[14186]: adjust time server 10.13.13.9 offset 0.010089 sec
#If you see a message, like the following, it's likely the clock is not yet synchronized.

#$> ntpdate -q 10.13.13.9
#server 10.13.13.9, stratum 16, offset 0.005689, delay 0.02837
#11 Dec 09:47:53 ntpdate[26030]: no server suitable for synchronization found
#To see details on the ntpd status, you can check with the below command on your docker host:

docker exec ${instanceName} ntpctl -s status
#4/4 peers valid, clock synced, stratum 2
