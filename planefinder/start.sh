#!/usr/bin/env bash
set -e

# Check if service has been disabled through the DISABLED_SERVICES environment variable.

if [[ ",$(echo -e "${DISABLED_SERVICES}" | tr -d '[:space:]')," = *",$BALENA_SERVICE_NAME,"* ]]; then
        echo "$BALENA_SERVICE_NAME is manually disabled. Sending request to stop the service:"
        curl --retry 10 --retry-all-errors --header "Content-Type:application/json" "$BALENA_SUPERVISOR_ADDRESS/v2/applications/$BALENA_APP_ID/stop-service?apikey=$BALENA_SUPERVISOR_API_KEY" -d '{"serviceName": "'$BALENA_SERVICE_NAME'"}'
        echo " "
        balena-idle
fi

# Verify that all the required variables are set before starting up the application.

echo "Verifying settings..."
echo " "
sleep 2

missing_variables=false
        
# Begin defining all the required configuration variables.

[ -z "$PLANEFINDER_SHARECODE" ] && echo "Plane Finder Sharecode is missing, will abort startup." && missing_variables=true || echo "Plane Finder Sharecode is set: $PLANEFINDER_SHARECODE"
[ -z "$LAT" ] && echo "Receiver latitude is missing, will abort startup." && missing_variables=true || echo "Receiver latitude is set: $LAT"
[ -z "$LON" ] && echo "Receiver longitude is missing, will abort startup." && missing_variables=true || echo "Receiver longitude is set: $LON"
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

# Variables are verified – continue with startup procedure.

# Configure Planefinder according to environment variables.
envsubst < /etc/pfclient-config.json.tpl> /etc/pfclient-config.json

# Start pfclient and put it in the background.
/usr/bin/pfclient --config_path=/etc/pfclient-config.json --log_path=/dev/console &

# Wait for any services to exit.
wait -n
