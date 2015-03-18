ovs-vsctl add-br mybridge
ovs-vsctl add-port mybridge wlan0
ifconfig wlan0 0
dhclient mybridge
# Setup each interface for one controller, one compute and one network node
ip tuntap add mode tap vport1
ip tuntap add mode tap vport2
ip tuntap add mode tap vport3
ovs-vsctl add-port mybridge vport1
ovs-vsctl add-port mybridge vport2
ovs-vsctl add-port mybridge vport3
ip l set up dev vport1
ip l set up dev vport2
ip l set up dev vport3
