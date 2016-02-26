# config wlan2 interface to operate with mtus of 1532 packet size (batman requires it) and turn enc off to ensure it works
sudo ifconfig wlan2 down
sudo ifconfig wlan2 mtu 1532
sudo iwconfig wlan2 enc off

# add the interface to the ad-hoc network - or create it
sudo iwconfig wlan2 mode ad-hoc essid TRC_Mesh_Wireless ap 02:12:34:56:78:9A channel 1

# load the module up
sudo modprobe batman-adv

# add wlan2 to the batman-adv virtual interface (so it can communicate with other batman-adv nodes)
sudo batctl if add wlan2
sudo ifconfig wlan2 up
sudo ifconfig bat0 up

# assign static ip to bat0 interface
sudo ifconfig bat0 192.168.1.10/24

# add bat0 to openvswitch switch (bridge) 

# sudo ovs-vsctl add-port br0 bat0


