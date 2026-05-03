#!/usr/bin/env bash
set -e

# Fetch rb24 apt signing key. Falls back to syseleven if keyserver.ubuntu.com
# is unreachable.
KEY_FPR=78F6D790E30AE7F360B716FED4F914061D043681
mkdir -p /etc/apt/keyrings
gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys "$KEY_FPR" || \
    gpg --keyserver hkps://keyserver.syseleven.de --recv-keys "$KEY_FPR"
gpg --export "$KEY_FPR" > /etc/apt/keyrings/rb24.gpg
echo 'deb [signed-by=/etc/apt/keyrings/rb24.gpg] https://apt.rb24.com/ trixie main' > /etc/apt/sources.list.d/rb24.list

arch="$(dpkg --print-architecture)"
echo "System Architecture: $arch"

# --- CONFIGURATION ---
# Configure multi-arch if necessary before updating sources
if [ "$arch" = "i386" ] || [ "$arch" = "amd64" ]; then
    dpkg --add-architecture armhf
fi

# Refresh sources
apt-get update

# --- PRE-INSTALL SYSTEMD ---
# We install systemd explicitly first to ensure the real /usr/bin/systemctl is on disk.
# This prevents race conditions or overwrites during the main install transaction.
apt-get install -y --no-install-recommends systemd

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
    apt-get install -y --no-install-recommends \
       rbfeeder:armhf qemu-user qemu-user-static binfmt-support libc6-armhf-cross
else
    apt-get install -y --no-install-recommends \
       rbfeeder
fi

# --- RESTORE SYSTEMCTL ---
rm -f /usr/bin/systemctl

# Restore original binary from diversion
if dpkg-divert --list | grep -q "/usr/bin/systemctl"; then
    dpkg-divert --remove --rename /usr/bin/systemctl
fi

# Cleanup
apt-get clean && apt-get autoremove -y && \
 rm -rf /var/lib/apt/lists/* /root/.gnupg
