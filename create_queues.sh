#!/bin/bash
set -o nounset
readonly BW=10000000 #10 Mbs/s
readonly MIN_RATE_LEVEL1=9000000 # 1,125 KB/s
readonly MAX_RATE_LEVEL1=9000000 # 
readonly MAX_RATE_LEVEL2=1000000 # 125 Kb/s
readonly MIN_RATE_LEVEL2=1000000 # 
readonly SWITCH="br0"

sudo ovs-vsctl list-ports $SWITCH | while read line
do 
  echo '['$line'] - ' Adding queues...
  port_name=$line
  sudo ovs-vsctl -- set Port $port_name qos=@newqos -- \
  --id=@newqos create Qos type=linux-htb other-config:max-rate=$BW queues=0=@q0,1=@q1,2=@q2 -- \
  --id=@q0 create Queue other-config:min-rate=$BW other-config:max-rate=$BW -- \
  --id=@q1 create Queue other-config:min-rate=$MIN_RATE_LEVEL1 other-config:max-rate=$MAX_RATE_LEVEL1 -- \
  --id=@q2 create Queue other-config:min-rate=$MIN_RATE_LEVEL2 other-config:max-rate=$MAX_RATE_LEVEL2
done
