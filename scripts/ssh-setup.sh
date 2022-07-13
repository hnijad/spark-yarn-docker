#!/usr/bin/env bash

for node in node-master node-1 node-2; do
    if [[ "$node" == "node-master" ]]; then
        docker exec $node bash -c "ssh-keygen -b 4096 -q -t rsa -N '' <<< $'\ny' >/dev/null 2>&1"
        docker exec $node bash -c "cat .ssh/id_rsa.pub >> .ssh/authorized_keys"
        docker exec $node bash -c  "service ssh restart"
        res=$(docker exec $node bash -c "cat .ssh/id_rsa.pub")
    else
        docker exec $node bash -c  "mkdir .ssh"
        docker exec $node bash -c  "echo $res >> .ssh/master.pub"
        docker exec $node bash -c  "cat .ssh/master.pub >> .ssh/authorized_keys"
        docker exec $node bash -c  "service ssh restart"
    fi    
done