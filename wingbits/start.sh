#!/usr/bin/env bash
set -e

# Check if service has been disabled through the DISABLED_SERVICES environment variable.

if [[ ",$(echo -e "${DISABLED_SERVICES}" | tr -d '[:space:]')," = *",$BALENA_SERVICE_NAME,"* ]]; then
        echo "$BALENA_SERVICE_NAME is manually disabled. Sending request to stop the service:"
        curl --fail --retry 86400 --retry-delay 1 --retry-all-errors --header "Content-Type:application/json" "$BALENA_SUPERVISOR_ADDRESS/v2/applications/$BALENA_APP_ID/stop-service?apikey=$BALENA_SUPERVISOR_API_KEY" -d '{"serviceName": "'$BALENA_SERVICE_NAME'"}'
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

# Check for idle variable (for manual flash of GeoSigner)
if [ -z "$WINGBITS_IDLE" ]
then
	echo "Wingbits idle not set. Continuing container startup."
else
	echo "Wingbits idle set. Idling container to allow manually flashing GeoSigner."
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

echo "Architecture is $GOOS-$GOARCH"
WINGBITS_PATH="/usr/local/bin"
WINGBITS_VERSION_PATH="/etc/wingbits"
local_version=$(cat $WINGBITS_VERSION_PATH/version)
local_json_version=$(wingbits -v | grep -oP '(?<=wingbits version )[^"]*')
echo "Current local version: $local_version"
echo "Current local build: $local_json_version"

SCRIPT_URL="https://gitlab.com/wingbits/config/-/raw/master/download.sh"
JSON_URL="https://install.wingbits.com/$GOOS-$GOARCH.json"
script=$(curl -s $SCRIPT_URL)
version=$(echo "$script" | grep -oP '(?<=WINGBITS_CONFIG_VERSION=")[^"]*')
script_json=$(curl -s $JSON_URL)
json_version=$(echo "$script_json" | jq -r '.Version')

echo "Latest available Wingbits version: $version"
echo "Latest available Wingbits build: $json_version"

# Check for Wingbits release hash override
if [ -z "$WINGBITS_RELEASE_HASH" ]
then
    echo "Wingbits release hash override not set. Proceeding..."
else
    echo "Wingbits release hash override set to $WINGBITS_RELEASE_HASH. Updating client to this version instead of latest version $json_version."
    json_version=$WINGBITS_RELEASE_HASH
fi

if [ "$version" != "$local_version" ] || [ "$json_version" != "$local_json_version" ] || [ -z "$json_version" ] || [ -z "$version" ]; then

    # Change update message based on presence of release hash override
    if [ -z "$WINGBITS_RELEASE_HASH" ]
    then
        echo "WARNING: You are not running the latest Wingbits version. Updating..."
    else
        echo "Getting updated client to match overriden version provided ($WINGBITS_RELEASE_HASH)"
    fi

    echo "Getting update for architecture $GOOS-$GOARCH"
    rm -rf $WINGBITS_PATH/wingbits.gz
    curl -s -o $WINGBITS_PATH/wingbits.gz "https://install.wingbits.com/$json_version/$GOOS-$GOARCH.gz"
    rm -rf $WINGBITS_PATH/wingbits
    gunzip $WINGBITS_PATH/wingbits.gz 
    chmod +x $WINGBITS_PATH/wingbits
    echo "$version" > $WINGBITS_VERSION_PATH/version
    echo "$json_version" > $WINGBITS_VERSION_PATH/json-version
    echo "New Wingbits version installed: $version"
    echo "New Wingbits build installed: $json_version"
else
    echo "Wingbits is up to date"
fi

echo " "

# Variables are verified – continue with startup procedure.

# Place correct station ID in /etc/wingbits/device
echo -E "${WINGBITS_DEVICE_ID}" > $WINGBITS_VERSION_PATH/device

# If UAT is enabled through config, enable feeding of UAT data to Wingbits.
# Create lists
WINGBITS_NET_CONNECTOR=()
WINGBITS_NET_CONNECTOR+=("--net-connector=$RECEIVER_HOST,$RECEIVER_PORT,beast_in")
if [[ "$UAT_ENABLED" = "true" ]]; then
    WINGBITS_NET_CONNECTOR+=("--net-connector=dump978-fa,30978,uat_in")
fi

# Start readsb and wingbits feeder and put in the background.
/usr/bin/feed-wingbits --net --net-only --debug=n --quiet --net-connector localhost,30006,json_out --write-json /run/wingbits-feed --net-beast-reduce-interval 0.5 --net-heartbeat 60 --net-ro-size 1280 --net-ro-interval 0.2 --net-ro-port 0 --net-sbs-port 0 --net-bi-port 30154 --net-bo-port 0 --net-ri-port 0 "${WINGBITS_NET_CONNECTOR[@]}" 2>&1 | stdbuf -o0 sed --unbuffered '/^$/d' |  awk -W interactive '{print "[readsb-wingbits]     " $0}' &
wingbits feeder start 2>&1 | stdbuf -o0 sed --unbuffered '/^$/d' |  awk -W interactive '{print "[wingbits-feeder]     " $0}' &

# Wait for any services to exit.
wait -n
