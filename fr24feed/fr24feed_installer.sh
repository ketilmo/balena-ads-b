#!/usr/bin/env bash
set -e

arch="$(dpkg --print-architecture)"
echo System Architecture: $arch

if [ "$arch" = "arm64" ]; then
	fr24feed_arch=arm64
	fr24feed_path="rpi_binaries"
elif [ "$arch" = "amd64" ]; then
	fr24feed_arch=amd64
	fr24feed_path="linux_binaries"
else
	fr24feed_arch=armhf
	fr24feed_path="rpi_binaries"
fi

cd /tmp

fr24feed_installer="fr24feed_${FR24FEED_VERSION}_${fr24feed_arch}.tgz"
primary_url="https://repo-feed.flightradar24.com/${fr24feed_path}/${fr24feed_installer}"
fallback_url="https://s3.dualstack.us-east-1.amazonaws.com/repo.feed.flightradar24.com/${fr24feed_path}/${fr24feed_installer}"

wget -O fr24feed.tgz "$primary_url" || wget -O fr24feed.tgz "$fallback_url"

tar xf fr24feed.tgz --strip-components 1
