#!/bin/bash - 
#===============================================================================
#
#          FILE: clone_routing_table_main.sh
# 
#         USAGE: ./clone_routing_table_main.sh 
# 
#   DESCRIPTION: Set up two separate routing table: table main: wifi, table 2: 4g
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: THIEN PHAM 
#  ORGANIZATION: 
#       CREATED: 01/27/2016 05:31
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# Firstly, delete all device with subnet 192.168.1.0/24 in table main
sudo ip route del 192.168.1.0/24 dev bat0
sudo ip route del 192.168.1.0/24 dev veth0
sudo ip route del 192.168.1.0/24 dev veth1
sudo ip route del 192.168.1.0/24 dev veth2
sudo ip route del 192.168.1.0/24 dev veth3
sudo ip route del 192.168.1.0/24 dev eth0
# Clone routes from table main to table 2
sudo ip route show table main | grep -Ev ^default | while read ROUTE ; do 
                                                      sudo ip route add table 2 $ROUTE 
                                                    done
# add 4g interface gateway (wlan1 must be connected to 4g hotspot first) to table 2
sudo ip route add default via 172.20.10.1 dev wlan1 table 2

# virtual interface veth3 is used to forward packets to 4g interface, therefore, add it to table 2
sudo ip route add 192.168.1.0/24 dev veth3 table 2

# virtual interface veth1 is used to forward packets to wifi interface, therefore, add it to table main
sudo ip route add 192.168.1.0/24 dev veth1 

# delete all auto-added default gw in table main
sudo ip route del default
sudo ip route del default
sudo ip route del default
sudo ip route add default via 129.127.229.254 dev wlan0
