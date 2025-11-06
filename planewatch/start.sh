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
[ -z "$LAT" ] && echo "Receiver latitude is missing, will abort startup." && missing_variables=true || echo "Receiver latitude is set: $LAT"
[ -z "$LON" ] && echo "Receiver longitude is missing, will abort startup." && missing_variables=true || echo "Receiver longitude is set: $LON"
[ -z "$ALT" ] && echo "Receiver altitude is missing, will abort startup." && missing_variables=true || echo "Receiver altitude is set: $ALT"
[ -z "$PLANEWATCH_API_KEY" ] && echo "plane.watch API key is missing, will abort startup." && missing_variables=true || echo "plane.watch API Key is set: $PLANEWATCH_API_KEY"
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

# Check if pw-feeder is latest version

local_version=v$(pw-feeder -v | grep version | cut -d ' ' -f 3)
echo "Current local version: $local_version"

version=$(git -c 'versionsort.suffix=-' ls-remote --exit-code --refs --sort='version:refname' --tags https://github.com/plane-watch/pw-feeder.git '*.*.*' | tail --lines=1 | cut --delimiter='/' --fields=3)
echo "Latest available plane.watch pw-feeder version: $version"

if [ "$version" != "$local_version" ] || [ -z "$version" ]; then
    echo "WARNING: You are not running the latest plane.watch pw-feeder version. Please update at your earliest convenience."
else
    echo "plane.watch pw-feeder is up to date"
fi

echo " "

# Variables are verified – continue with startup procedure.

# start pw-feeder
/usr/local/sbin/pw-feeder --beasthost "$RECEIVER_HOST" --beastport "$RECEIVER_PORT" --apikey "$PLANEWATCH_API_KEY" 2>&1 | stdbuf -o0 sed --unbuffered '/^$/d' | awk -W interactive '{print "[planewatch-feeder]    "  $0}' &

# start mlat-client
/usr/local/share/mlat-client/venv/bin/mlat-client --input-type dump1090 --no-udp --input-connect "$RECEIVER_HOST":"$RECEIVER_PORT" --user "$PLANEWATCH_API_KEY" --lat "$LAT" --lon "$LON" --alt "$ALT" --results "beast,listen,30105" --server 127.0.0.1:12346 2>&1 | stdbuf -o0 sed --unbuffered '/^$/d' | awk -W interactive '{print "[mlat-client]    "  $0}' &

# Wait for any services to exit.
wait -n
