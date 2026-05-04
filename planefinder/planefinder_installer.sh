#!/usr/bin/env bash
set -e

arch="$(dpkg --print-architecture)"
echo System Architecture: $arch

case "$arch" in
	arm64|amd64|armhf)
		planefinder_version="$PLANEFINDER_VERSION"
		planefinder_arch="$arch"
		;;
	i386)
		# PlaneFinder dropped i386 builds after 5.0.161; pin to the
		# last release that ships an i386 .deb.
		planefinder_version="5.0.161"
		planefinder_arch="i386"
		;;
	*)
		echo "Unsupported architecture for PlaneFinder: $arch" >&2
		exit 1
		;;
esac

apt-get update && apt-get install -y --no-install-recommends wget

planefinder_packet="pfclient_${planefinder_version}_${planefinder_arch}.deb"

cd /tmp/

wget -O PlaneFinder.deb https://client.planefinder.net/$planefinder_packet
apt-get install -y --no-install-recommends ./PlaneFinder.deb
rm -rf PlaneFinder.deb

apt-get purge -y wget && \
	apt-get clean && apt-get autoremove -y && \
	rm -rf /var/lib/apt/lists/*
