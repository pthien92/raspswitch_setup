sudo ovs-vsctl del-br br0
sudo ovs-vsctl add-br br0
sudo ovs-vsctl add-port br0 eth0
sudo ovs-vsctl add-port br0 veth0
sudo ovs-vsctl add-port br0 veth2
#sudo ovs-vsctl add-port br0 bat0
sudo ovs-vsctl set-controller br0 tcp:129.127.229.170:6633 tcp:129.127.228.77:6633
sudo ovs-vsctl set controller br0 connection-mode=out-of-band

