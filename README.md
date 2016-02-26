# RASPSWITCH Setup scripts
Simple startup sequence:

```sh
sudo dhclient -v wlan0 # if wlan0 has not obtained IP from router yet
sudo dhclient -v wlan1 # run this whenever we want to connect to 4G

./create_veth.sh       # to create virtual interface
./create_switch.sh     # to create openswitch bridge, add ports, ...
./create_queues.sh     # add queues to each port
./enable_nat.sh        # packets forwarding and NAT for wlan0 and wlan1, ...
./clone_routing_table_main.sh   # copy and create table 2 (table rt_4g) routes intances
```
