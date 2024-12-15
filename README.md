
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

Boot from TFTP

