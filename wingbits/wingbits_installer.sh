#!/usr/bin/env bash
set -e

function setup_wingbits_client() {
	# Determine the architecture
        GOOS="linux"
	case "$(uname -m)" in
		x86_64)
			GOARCH="amd64"
			;;
		i386|i686)
			GOARCH="386"
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
	curl -o $WINGBITS_PATH/wingbits.gz "https://install.wingbits.com/$WINGBITS_COMMIT_ID/$GOOS-$GOARCH.gz"
	gunzip $WINGBITS_PATH/wingbits.gz 
	chmod +x $WINGBITS_PATH/wingbits
	PATH=$WINGBITS_PATH:$PATH
}

setup_wingbits_client
