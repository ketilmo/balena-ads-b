#!/usr/bin/env bash
set -e

function setup_wingbits_client() {
	# Determine the architecture
        GOOS="linux"
	case "$(uname -m)" in
		x86_64)
			GOARCH="amd64"
			;;
		armv7l)
			GOARCH="arm"
			;;
		aarch64|arm64)
			GOARCH="arm64"
			;;
		*)
			echo "Unsupported architecture"
			exit 1
			;;
	esac
	WINGBITS_PATH="/usr/local/bin"
        WINGBITS_VERSION_PATH="/etc/wingbits"
	echo "Architecture: $GOOS-$GOARCH"
	mkdir -p $WINGBITS_PATH
        mkdir -p $WINGBITS_VERSION_PATH

	# Pick the expected SHA256 (base64, as published by install.wingbits.com)
	# from the per-arch ENV var baked into the Dockerfile alongside
	# WINGBITS_COMMIT_ID. The two are updated in lockstep by Renovate's
	# custom.wingbits-binary manager, so the binary URL and the verified
	# checksum always refer to the same upstream release — unlike the
	# unversioned manifest URL, which would race against new upstream
	# builds on a rebuild of an older base.
	sha_var="WINGBITS_SHA256_${GOARCH^^}"
	expected_sha256_b64="${!sha_var}"
	if [ -z "$expected_sha256_b64" ]; then
		echo "Missing expected SHA256: $sha_var is not set" >&2
		exit 1
	fi
	expected_sha256_hex=$(printf '%s' "$expected_sha256_b64" | base64 -d | od -An -tx1 | tr -d ' \n')

	curl -fsSL -o $WINGBITS_PATH/wingbits.gz "https://install.wingbits.com/$WINGBITS_COMMIT_ID/$GOOS-$GOARCH.gz"
	gunzip $WINGBITS_PATH/wingbits.gz

	echo "$expected_sha256_hex  $WINGBITS_PATH/wingbits" | sha256sum -c -

	chmod +x $WINGBITS_PATH/wingbits

	# The upstream client is UPX-packed (whole exe resident in anon RAM).
	# Decompress AFTER the checksum check (the published SHA256 is for the
	# packed binary) so its code pages become demand-paged/reclaimable.
	# Best-effort: keep the working packed binary if upx is missing or fails.
	if grep -qa 'UPX!' "$WINGBITS_PATH/wingbits"; then
		upx -d "$WINGBITS_PATH/wingbits" || echo "wingbits: upx -d failed; using packed binary"
	fi

	PATH=$WINGBITS_PATH:$PATH
}

setup_wingbits_client
