sudo iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
sudo iptables -t nat -A POSTROUTING -o wlan1 -j MASQUERADE
sudo ip rule add fwmark 2 table 2
sudo iptables -t mangle -A PREROUTING -i veth3 -j MARK --set-mark 2
sudo iptables -t mangle -A PREROUTING -i wlan1 -j MARK --set-mark 2
sudo iptables -t mangle -A FORWARD -i wlan0 -o veth1 -j ACCEPT
sudo iptables -t mangle -A FORWARD -i wlan1 -o veth3 -j ACCEPT

