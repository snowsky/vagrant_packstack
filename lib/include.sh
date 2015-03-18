export CONTROLLER_IP="192.168.10.2"
export NETWORK_IP="192.168.10.3"
export COMPUTE_IP="192.168.10.4"
export NETMASK="24"

function prep() {
  sudo systemctl stop NetworkManager
  sudo systemctl disable NetworkManager
  sudo systemctl enable network
  
  interface=$(ip a | grep "$MANAGEMENT_IP" -B 2 | head -n1 | cut -d: -f2)
  interface=${interface//[[:blank:]]/}
  
  echo "interface: $interface"
  [[ -z "$interface" ]] && echo "No interface"
  nic="/etc/sysconfig/network-scripts/ifcfg-$interface"
  [[ `grep DEVICE $nic` ]] || echo "DEVICE=$interface" >> $nic
  
  sudo ifdown $interface
  sudo systemctl start network
  sudo ip a a "$MANAGEMENT_IP"/"$NETMASK" dev $interface
  sudo ip l set up dev $interface
}
