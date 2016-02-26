#!/bin/bash - 
#===============================================================================
#
#          FILE: create_veth.sh
# 
#         USAGE: ./create_veth.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 02/09/2016 03:31
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
sudo ip link add name veth0 type veth peer name veth1
sudo ip link add name veth2 type veth peer name veth3


