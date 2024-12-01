#!/usr/bin/env bash
set -e

# Check if service has been disabled through the DISABLED_SERVICES environment variable.

if [[ ",$(echo -e "${DISABLED_SERVICES}" | tr -d '[:space:]')," = *",$BALENA_SERVICE_NAME,"* ]]; then
        echo "$BALENA_SERVICE_NAME is manually disabled. Sending request to stop the service:"
        curl --header "Content-Type:application/json" "$BALENA_SUPERVISOR_ADDRESS/v2/applications/$BALENA_APP_ID/stop-service?apikey=$BALENA_SUPERVISOR_API_KEY" -d '{"serviceName": "'$BALENA_SERVICE_NAME'"}'
        echo " "
        balena-idle
fi

# Verify that all the required variables are set before starting up the application.

echo "Verifying settings..."
echo " "
sleep 2

missing_variables=false
        
# Begin defining all the required configuration variables.

[ -z "$WINGBITS_DEVICE_ID" ] && echo "Wingbits Device ID is missing, will abort startup." && missing_variables=true || echo "Wingbits Device ID is set: $WINGBITS_DEVICE_ID"
[ -z "$RECEIVER_HOST" ] && echo "Receiver host is missing, will abort startup." && missing_variables=true || echo "Receiver host is set: $RECEIVER_HOST"
[ -z "$RECEIVER_PORT" ] && echo "Receiver port is missing, will abort startup." && missing_variables=true || echo "Receiver port is set: $RECEIVER_PORT"

# End defining all the required configuration variables.

echo " "

if [ "$missing_variables" = true ]
then
        echo "Settings missing, aborting..."
        echo " "
        balena-idle
fi

echo "Settings verified, proceeding with startup."
echo " "

# Check if Wingbits is latest version and update if not

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

WINGBITS_PATH="/etc/wingbits"
local_version=$(cat $WINGBITS_PATH/version)
local_json_version=$(cat $WINGBITS_PATH/json-version)
echo "Current local version: $local_version"
echo "Current local build: $local_json_version"

SCRIPT_URL="https://install.wingbits.com/download.sh"
JSON_URL="https://install.wingbits.com/$GOOS-$GOARCH.json"
script=$(curl -s $SCRIPT_URL)
version=$(echo "$script" | grep -oP '(?<=WINGBITS_CONFIG_VERSION=")[^"]*')
script_json=$(curl -s $JSON_URL)
json_version=$(echo "$script_json" | jq -r '.Version')

echo "Latest available Wingbits version: $version"
echo "Latest available Wingbits build: $json_version"

if [ "$version" != "$local_version" ] || [ "$json_version" != "$local_json_version" ] || [ -z "$json_version" ] || [ -z "$version" ]; then
    echo "WARNING: You are not running the latest Wingbits version. Updating..."
    echo "Architecture: $GOOS-$GOARCH"
    rm -rf $WINGBITS_PATH/wingbits.gz
    curl -s -o $WINGBITS_PATH/wingbits.gz "https://install.wingbits.com/$json_version/$GOOS-$GOARCH.gz"
    rm -rf $WINGBITS_PATH/wingbits
    gunzip $WINGBITS_PATH/wingbits.gz 
    chmod +x $WINGBITS_PATH/wingbits
    rm -rf $WINGBITS_PATH/config.json
    curl -s -o $WINGBITS_PATH/config.json "https://install.wingbits.com/config.json"
    echo "$version" > $WINGBITS_PATH/version
    echo "$json_version" > $WINGBITS_PATH/json-version
    echo "New Wingbits version installed: $version"
    echo "New Wingbits build installed: $json_version"
else
    echo "Wingbits is up to date"
fi

echo " "

# Variables are verified – continue with startup procedure.

# Place correct station ID in config.json and /etc/wingbits/device
station="$(jq --arg a "$WINGBITS_DEVICE_ID" '.station = $a' $WINGBITS_PATH/config.json)"
echo -E "${station}" > $WINGBITS_PATH/config.json
echo -E "${WINGBITS_DEVICE_ID}" > $WINGBITS_PATH/device

# Move to wingbits folder
cd $WINGBITS_PATH

# Start readsb and wingbits feeder and put in the background.
/usr/bin/feed-wingbits --net --net-only --debug=n --quiet --net-connector localhost,30006,json_out --write-json /run/wingbits-feed --net-beast-reduce-interval 0.5 --net-heartbeat 60 --net-ro-size 1280 --net-ro-interval 0.2 --net-ro-port 0 --net-sbs-port 0 --net-bi-port 30154 --net-bo-port 0 --net-ri-port 0 --net-connector "$RECEIVER_HOST","$RECEIVER_PORT",beast_in 2>&1 | stdbuf -o0 sed --unbuffered '/^$/d' |  awk -W interactive '{print "[readsb-wingbits]     " $0}' &
./wingbits feeder start 2>&1 | stdbuf -o0 sed --unbuffered '/^$/d' |  awk -W interactive '{print "[wingbits-feeder]     " $0}' &

# Wait for any services to exit.
wait -n
