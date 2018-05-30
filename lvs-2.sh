apt-get update
apt-get install -y ipvsadm keepalived
cat ./2keepalived.conf > /etc/keepalived/keepalived.conf
service keepalived restart
cat ./interfaces.lvs2 >> /etc/network/interfaces
ifup eth0
ifup eth1
ifup eth2
ifup eth3
sysctl -w net.ipv4.ip_forward=1