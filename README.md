
# OpenWRT ONE Test Firmware for Meshtasticd

## Build Instructions
```
git clone -b openwrt-one https://github.com/openwrt-meshtastic/openwrt.git
cd openwrt
cp openwrt-one .config

./scripts/feeds update -a
./scripts/feeds install -a
make oldconfig
make -j$(nproc)
```

## Install the Meshtasticd packages
```
still todo
```

## Configure config.yaml
```
You now require to set either MACAddress or MACAddressSource
```
## Configure your LoRa Radio
```
nano /etc/meshtasticd/config.d/OpenWRT-One-mikroBUS-LR-IOT-CLICK.yaml
##  https://www.mikroe.com/lr-iot-click
Lora:
  Module: lr1110  # OpenWRT ONE mikroBUS
#  CS: 25
  IRQ: 10
  Busy: 12
#  Reset: 2
  spidev: spidev2.0
  DIO3_TCXO_VOLTAGE: 1.6
```

## Ready Build use Instructions

## Boot from TFTP
```

        ( ( ( OpenWrt ) ) )  [SPI-NAND]       U-Boot 2024.10-OpenWrt-r27893-b6bb
      1. Run default boot command.
      2. Boot system via TFTP.
      3. Boot production system from NAND.
      4. Boot recovery system from NAND.
      5. Load production system via TFTP then write to NAND.
      6. Load recovery system via TFTP then write to NAND.
      7. Load BL31+U-Boot FIP via TFTP then write to NAND.
      8. Load BL2 preloader via TFTP then write to NAND.
      9. Reboot.
      a. Reset all settings to factory defaults.
      0. Exit


  Press UP/DOWN to move, ENTER to select, ESC to quit
  
  
```
#https://openwrt.org/toh/mikrotik/common
#!/bin/bash
USER=user
#IFNAME=eno1
IFNAME=enx000ec6817901

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
```



