#!/usr/bin/env bash
set -e

echo "kiosk not available on armv7hf: the browser block is only published for 64-bit devices."
echo "Use a 64-bit OS, or disable this service with DISABLED_SERVICES."
exec sleep infinity
