sudo ovs-ofctl add-flow br0 arp,idle_timeout=0,priority=10,nw_src=192.168.1.9,actions=3,4;
sudo ovs-ofctl add-flow br0 arp,idle_timeout=0,priority=10,nw_src=192.168.1.2,actions=2,4;
sudo ovs-ofctl add-flow br0 arp,idle_timeout=0,priority=10,nw_src=192.168.1.11,actions=2,1;
sudo ovs-ofctl add-flow br0 idle_timeout=0,priority=0,actions=NORMAL;
