#!/bin/bash

echo "net.ipv6.conf.all.disable_ipv6 = 0" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 0" >> /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6 = 0" >> /etc/sysctl.conf
sysctl -p
sleep 1

sed -i 'nameserver 2001:4860:4860::8888' /etc/resolv.conf

echo "auto he-ipv6" >> /etc/network/interfaces
echo "iface he-ipv6 inet6 v4tunnel" >> /etc/network/interfaces
echo "address 2001:470:c:6be::2" >> /etc/network/interfaces
echo "netmask 64" >> /etc/network/interfaces
echo "endpoint 66.220.18.42" >> /etc/network/interfaces
echo "local 107.175.61.23" >> /etc/network/interfaces
echo "ttl 255" >> /etc/network/interfaces
echo "gateway 2001:470:c:6be::1" >> /etc/network/interfaces
echo -e "ipv6添加完成,请重启系统..."
sleep 2
#/etc/init.d/networking restart
#sleep 1
#exit
