apt-get update
apt-get install -y apache2

cat ./interfaces.rs1 > /etc/network/interfaces
ifup eth1
ifup eth2

echo "101 LVS1" >> /etc/iproute2/rt_tables
echo "102 LVS2" >> /etc/iproute2/rt_tables
ip rule add from 192.168.100.0/24 table LVS1
ip rule add from 192.168.200.0/24 table LVS2
ip route add 192.168.200.0/24 dev eth2 src 192.168.200.20 table LVS2
ip route add default via 192.168.200.1 dev eth2 table LVS2
ip route add 192.168.100.0/24 dev eth1 src 192.168.100.10 table LVS1
ip route add default via 192.168.100.1 dev eth1 table LVS1


ip rule s
ip r s
ip r s table LVS1
ip r s table LVS2
