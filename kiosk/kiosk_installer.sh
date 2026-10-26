#!/usr/bin/env bash
set -e

# Drop archive.raspberrypi.com from apt sources before updating. On trixie
# `apt` uses sqv for signature verification, which rejects the Raspberry
# Pi archive's self-signed key (SHA1, banned by sqv policy since
# 2026-02-01) and fails the whole update. The repo is only present in the
# Raspberry Pi device-type browser base images and we don't install
# anything from it — cec-utils and tini both come from Debian main.
rm -f /etc/apt/sources.list.d/raspi.list

apt-get update
apt-get install -y --no-install-recommends \
    cec-utils \
    tini
apt-get clean && apt-get autoremove -y
rm -rf /var/lib/apt/lists/*
