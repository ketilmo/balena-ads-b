#!/usr/bin/env bash
set -e

arch="$(dpkg --print-architecture)"

# If host architecture is i386 or amd64, run AirNav Radar through armhf software emulation.
if [ "$arch" = "i386" ] || [ "$arch" = "amd64" ]; then 
	echo "Starting rbfeeder..."
	/usr/bin/qemu-arm-static /usr/bin/rbfeeder > /dev/null 2>&1 &
	servicePID=$!
	echo "Waiting 10 seconds..."
	sleep 10
	kill $servicePID
	/usr/bin/qemu-arm-static /usr/bin/rbfeeder --showkey --no-start
else 
	echo "Starting rbfeeder..."
	/usr/bin/rbfeeder > /dev/null 2>&1 &
	servicePID=$!
	echo "Waiting 10 seconds..."
	sleep 10
	kill $servicePID
	/usr/bin/rbfeeder --showkey --no-start
fi
