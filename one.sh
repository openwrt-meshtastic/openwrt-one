#https://openwrt.org/toh/mikrotik/common
#!/bin/bash
USER=user
#IFNAME=eno1
#IFNAME=enxa0cec8098788

#IFNAME=enx00133b56066d

IFNAME=enx000ec6817901

#IFNAME=enx00e04c36a6be

/sbin/ip addr replace 192.168.11.0/24 dev $IFNAME
/sbin/ip link set dev $IFNAME up
/usr/sbin/dnsmasq --user=$USER \
--no-daemon \
--listen-address 192.168.11.23 \
--bind-interfaces \
-p0 \
--dhcp-authoritative \
--dhcp-range=192.168.11.11,192.168.11.22 \
--bootp-dynamic \
--dhcp-boot=https://downloads.openwrt.org/snapshots//targets/mediatek/filogic/openwrt-mediatek-filogic-openwrt_one-nor-factory.bin \
--log-dhcp \
--enable-tftp \
--tftp-root=$(pwd)
