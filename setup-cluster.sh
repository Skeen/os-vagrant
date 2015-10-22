#!/bin/bash

vagrant up

JOIN_SWARM_URL="WITHHELD"
JOIN_SWARM_COMMAND="sudo docker run -d --privileged -v /var/run/docker.sock:/var/run/docker.sock rancher/agent:v0.8.2 $JOIN_SWARM_URL"

RANCHER_OS_VMS=$(vagrant status | grep "running" | cut -f 1 -d ' ')
for vm in $RANCHER_OS_VMS; do
    vagrant ssh $vm -c "$JOIN_SWARM_COMMAND"
done


