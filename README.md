
# OpenWRT ONE Test Firmware fir Meshtastic

## Build Instructions
git clone -b openwrt-one https://github.com/openwrt-meshtastic/openwrt.git
cd openwrt
cp openwrt-one .config

./scripts/feeds update -a
./scripts/feeds install -a
make oldconfig
make -j$(nproc)

## Ready Build use Instructions

Boot from TFTP
