#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

wget https://github.com/coolsnowwolf/lede/raw/master/include/meson.mk  -P ./include/
wget https://codeberg.org/aparcar/openwrt/src/branch/apk/include/openssl-engine.mk  -P ./include/

# Uncomment a feed source
sed -i "/helloworld/d" "feeds.conf.default"

# Add a feed source
echo "src-git gl https://github.com/gl-inet/gl-feeds.git;18.06" >> "feeds.conf.default"
echo "src-git packages https://github.com/openwrt/packages.git;openwrt-18.06" >> "feeds.conf.default"
echo "src-git luci https://github.com/openwrt/luci.git;openwrt-18.06" >> "feeds.conf.default"
echo "src-git routing https://github.com/openwrt/routing.git;openwrt-18.06" >> "feeds.conf.default"
echo "src-git telephony https://github.com/openwrt/telephony.git;openwrt-18.06" >> "feeds.conf.default"


./scripts/feeds clean
