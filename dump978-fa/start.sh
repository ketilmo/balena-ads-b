#!/usr/bin/env bash
set -e

# Check if service has been disabled through the DISABLED_SERVICES environment variable.
# Also check whether user is trying to set rtlsdr serial number for dump1090-fa.

if [[ ",$(echo -e "${DISABLED_SERVICES}" | tr -d '[:space:]')," = *",$BALENA_SERVICE_NAME,"* ]] || [[ "$DUMP1090_IDLE" = "true" ]]; then
        echo "$BALENA_SERVICE_NAME is manually disabled. Sending request to stop the service:"
        curl --fail --retry 86400 --retry-delay 1 --retry-all-errors --header "Content-Type:application/json" "$BALENA_SUPERVISOR_ADDRESS/v2/applications/$BALENA_APP_ID/stop-service?apikey=$BALENA_SUPERVISOR_API_KEY" -d '{"serviceName": "'$BALENA_SERVICE_NAME'"}'
        echo " "
        balena-idle
fi

# Check if service has been enabled through the UAT_ENABLED environment variable.

if ! [[ "$UAT_ENABLED" = "true" ]]; then
        echo "$BALENA_SERVICE_NAME is not enabled. Sending request to stop the service:"
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
[ -z "$DUMP978_DEVICE" ] && echo "RTLSDR device not specified. Using default values." && DUMP978_DRIVER="rtlsdr" || echo "RTLSDR device specified: $DUMP978_DEVICE" && DUMP978_DRIVER="rtlsdr,serial=$DUMP978_DEVICE"

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

# Check for idle variable (for setting eeprom / serial)
if [ -z "$DUMP978_IDLE" ]
then
	echo "DUMP978 idle not set. Continuing container startup."
else
	echo "DUMP978 idle set. Idling container to allow setting rtlsdr serial."
 	balena-idle
fi

# rtl-sdr bias tee enable (this container only supports rtl-sdr so no need to check radio device type)
if [ "$RTL978_BIASTEE_ENABLE" = "true" ]
then
	echo "Enabling rtl-sdr bias tee for device ${DUMP978_DEVICE:=0}"
 	rtl_biast -d "$DUMP978_DEVICE" -b 1
fi

# Check for gain value
if [ -z "$DUMP978_GAIN" ]
then
	echo "DUMP978 gain not set. Using autogain."
        SDR_GAIN="--sdr-auto-gain"
else
	echo "DUMP978 gain set. Using gain value $DUMP978_GAIN"
 	SDR_GAIN="--sdr-gain $DUMP978_GAIN"
fi

# Start dump978-fa and put it in the background.
/usr/bin/dump978-fa --sdr driver="$DUMP978_DRIVER" --raw-port 0.0.0.0:30978 --json-port 0.0.0.0:30979 --format CS8 "$SDR_GAIN" &

# Start skyaware978 and put it in the background.
/usr/bin/skyaware978 --connect localhost:30978 --reconnect-interval 30 --lat "$LAT" --lon "$LON" --json-dir /run/skyaware978 &

# Start lighthttpd and put it in the background.
/usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf &

# Check if device reboot on service exit has been enabled through the REBOOT_DEVICE_ON_SERVICE_EXIT environment variable.
if [[ "$REBOOT_DEVICE_ON_SERVICE_EXIT" == "true" ]]; then
        echo "Device reboot on service exit is enabled."
fi

# Wait for any services to exit.
wait -n

if [[ "$REBOOT_DEVICE_ON_SERVICE_EXIT" == "true" ]]; then
        echo "Service exited, rebooting the device..."
        curl --fail --retry 86400 --retry-delay 1 --retry-all-errors -X POST --header "Content-Type:application/json" "$BALENA_SUPERVISOR_ADDRESS/v1/reboot?apikey=$BALENA_SUPERVISOR_API_KEY"
fi
