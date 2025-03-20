#!/usr/bin/env bash
set -e

arch="$(dpkg --print-architecture)"
echo System Architecture: $arch

if [ "$arch" = "arm64" ]; then 
	opensky_arch="arm64"
elif [ "$arch" = "amd64" ]; then 
	opensky_arch="amd64"
elif [ "$arch" = "i386" ]; then 
	opensky_arch="i386"
else 
	opensky_arch="armhf"
fi

opensky_packet="opensky-feeder_${OPENSKY_VERSION}_$opensky_arch.deb"

wget -O /tmp/OpenSky.deb https://old.opensky-network.org/files/firmware/$opensky_packet
