#!/usr/bin/env bash
set -e

ARCH=arm
if dpkg --print-architecture | grep -F -e armhf &>/dev/null; then
    if uname -m | grep -qs -e armv7; then
        ARCH=armv7
    else
        ARCH=arm
    fi
elif uname -m | grep -F -e arm64 -e aarch64 &>/dev/null; then
    ARCH=arm64
elif uname -m | grep -F -e arm &>/dev/null; then
    # unexpected fallback
    ARCH=arm
elif dpkg --print-architecture | grep -F -e i386 &>/dev/null; then
    ARCH=i386
elif uname -m | grep -F -e x86_64 &>/dev/null; then
    ARCH=x86_64
    if cat /proc/cpuinfo | grep flags | grep popcnt | grep sse4_2 &>/dev/null; then
        ARCH=nehalem
    fi
else
	echo "Unable to download Airspy ADS-B for your platform!"
fi

URL="https://github.com/wiedehopf/airspy-conf/raw"

OS="bookworm"

binary="${URL}/${AIRSPY_VERSION}/${OS}/airspy_adsb-linux-${ARCH}.tgz"

cd /tmp/

wget -q -O airspy.tgz $binary
rm -f ./airspy_adsb
tar xzf airspy.tgz
cp -f airspy_adsb /usr/local/bin/
