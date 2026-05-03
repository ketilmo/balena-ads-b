#!/usr/bin/env bash
set -e

arch="$(dpkg --print-architecture)"
echo System Architecture: $arch

if [ "$arch" = "arm64" ] || [ "$arch" = "amd64" ]; then
	planefinder_arch="$arch"
else
	planefinder_arch="armhf"
fi

apt-get update && apt-get install -y --no-install-recommends wget

planefinder_packet="pfclient_${PLANEFINDER_VERSION}_${planefinder_arch}.deb"

cd /tmp/

wget -O PlaneFinder.deb https://client.planefinder.net/$planefinder_packet
apt-get install -y --no-install-recommends ./PlaneFinder.deb
rm -rf PlaneFinder.deb

apt-get purge -y wget && \
	apt-get clean && apt-get autoremove -y && \
	rm -rf /var/lib/apt/lists/*
