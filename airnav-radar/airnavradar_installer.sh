#!/usr/bin/env bash
set -e

# Import our key to apt-key
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 1D043681

# Create a new debian repository source file (overwrites if exists)
echo 'deb https://apt.rb24.com/ bookworm main' > /etc/apt/sources.list.d/rb24.list

arch="$(dpkg --print-architecture)"
echo "System Architecture: $arch"

# --- CONFIGURATION ---
# Configure multi-arch if necessary before updating sources
if [ "$arch" = "i386" ] || [ "$arch" = "amd64" ]; then
    dpkg --add-architecture armhf
fi

# Refresh sources
apt update

# --- PRE-INSTALL SYSTEMD ---
# We install systemd explicitly first to ensure the real /usr/bin/systemctl is on disk.
# This prevents race conditions or overwrites during the main install transaction.
apt install -y --no-install-recommends systemd

# --- MOCKING SYSTEMCTL ---
# Divert /usr/bin/systemctl (moves the now-existing real binary to .real)
if ! dpkg-divert --list | grep -q "/usr/bin/systemctl"; then
    dpkg-divert --add --rename --divert /usr/bin/systemctl.real /usr/bin/systemctl
fi

# Create the dummy mock script
echo '#!/bin/sh' > /usr/bin/systemctl
echo 'echo "Mock systemctl: command ignored during build"' >> /usr/bin/systemctl
echo 'exit 0' >> /usr/bin/systemctl
chmod +x /usr/bin/systemctl

# --- INSTALL RBFEEDER ---
if [ "$arch" = "i386" ] || [ "$arch" = "amd64" ]; then
    apt install -y --no-install-recommends \
       rbfeeder:armhf qemu-user qemu-user-static binfmt-support libc6-armhf-cross
else
    apt install -y --no-install-recommends \
       rbfeeder
fi

# --- RESTORE SYSTEMCTL ---
rm -f /usr/bin/systemctl

# Restore original binary from diversion
if dpkg-divert --list | grep -q "/usr/bin/systemctl"; then
    dpkg-divert --remove --rename /usr/bin/systemctl
fi

# Cleanup
apt clean && apt autoclean && apt autoremove && \
 rm -rf /var/lib/apt/lists/*
