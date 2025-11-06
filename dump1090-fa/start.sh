#!/usr/bin/env bash
set -e

# Check if service has been disabled through the DISABLED_SERVICES environment variable.
# Also check whether user is trying to set rtlsdr serial number for dump978-fa.

if [[ ",$(echo -e "${DISABLED_SERVICES}" | tr -d '[:space:]')," = *",$BALENA_SERVICE_NAME,"* ]] || [[ "$DUMP978_IDLE" = "true" ]]; then
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
if [ -z "$DUMP1090_IDLE" ]
then
	echo "DUMP1090 idle not set. Continuing container startup."
else
	echo "DUMP1090 idle set. Idling container to allow setting rtlsdr serial."
 	balena-idle
fi

radio_device_lower=$(echo "${RADIO_DEVICE_TYPE}" | tr '[:upper:]' '[:lower:]')

if [ "$radio_device_lower" = "modesbeast" ]
then
        dump1090configuration="--device-type none --device "none" --net-only --net-bo-port 30105"
elif [ "$radio_device_lower" = "airspy" ]
then
        dump1090configuration="--device-type none --device "none" --net-only --net-bo-port 30105"
elif [ "$radio_device_lower" = "hackrf" ]
then
        dump1090configuration="--device-type hackrf --device "none" --net-bo-port 30005,30105"
elif [ "$radio_device_lower" = "bladerf" ]
then
        dump1090configuration="--device-type bladerf --device "$DUMP1090_DEVICE" --net-bo-port 30005,30105"
elif [ "$radio_device_lower" = "limesdr" ]
then
        dump1090configuration="--device-type limesdr --device "none" --net-bo-port 30005,30105"
elif [ "$radio_device_lower" = "soapy" ]
then
        dump1090configuration="--device-type soapy --device "$DUMP1090_DEVICE" --net-bo-port 30005,30105"
else
        radio_device_lower="rtlsdr"
	dump1090configuration="--device-type rtlsdr --device "${DUMP1090_DEVICE:=0}" --net-bo-port 30005,30105"
fi

echo "Radio device type set to $radio_device_lower"

# rtl-sdr bias tee enable
if [ "$radio_device_lower" = "rtlsdr" ] && [ "$RTL1090_BIASTEE_ENABLE" = "true" ]
then
	echo "Enabling rtl-sdr bias tee for device $DUMP1090_DEVICE"
 	rtl_biast -d "$DUMP1090_DEVICE" -b 1
fi

# Build dump1090 configuration
dump1090configuration="${dump1090configuration} --lat "$LAT" --lon "$LON" --fix --ppm "$DUMP1090_PPM" --max-range "$DUMP1090_MAX_RANGE" --net --net-heartbeat 60 --net-ro-size 1000 --net-ro-interval 0.05 --net-http-port 0 --net-ri-port 0 --net-ro-port 30002,30102 --net-sbs-port 30003 --net-bi-port 30004,30104 --raw --json-location-accuracy 2 --write-json /run/dump1090-fa --quiet"
if [[ -z "$DUMP1090_GAIN" ]] && [[ "$DUMP1090_ADAPTIVE_DYNAMIC_RANGE" != "false" ]]; then
        echo "Gain is not specified. Will enable Adaptive Dynamic Range."
        DUMP1090_ADAPTIVE_DYNAMIC_RANGE="true"
elif [[ -n "$DUMP1090_GAIN" ]]; then
        echo "Gain value set manually to $DUMP1090_GAIN. Disabling adaptive gain." && dump1090configuration="${dump1090configuration} --gain $DUMP1090_GAIN"
        DUMP1090_ADAPTIVE_DYNAMIC_RANGE="false"
fi

if [[ "$DUMP1090_ADAPTIVE_DYNAMIC_RANGE" == "true" ]]; then
        echo "Enabling Adaptive Dynamic Range." && dump1090configuration="${dump1090configuration} --adaptive-range"
        if [[ "$DUMP1090_ADAPTIVE_DYNAMIC_RANGE_TARGET" != "" ]]; then
                echo "Setting Adaptive Dynamic Range Target to $DUMP1090_ADAPTIVE_DYNAMIC_RANGE_TARGET." && dump1090configuration="${dump1090configuration} --adaptive-range-target $DUMP1090_ADAPTIVE_DYNAMIC_RANGE_TARGET"
        fi
fi

if [[ "$DUMP1090_ADAPTIVE_BURST" == "true" ]]; then
        echo "Enabling Adaptive Burst." && dump1090configuration="${dump1090configuration} --adaptive-burst"
fi
if [[ "$DUMP1090_ADAPTIVE_BURST_LOUD_RATE" != "" ]]; then
        echo "Setting Adaptive Burst Loud Rate to $DUMP1090_ADAPTIVE_BURST_LOUD_RATE" && dump1090configuration="${dump1090configuration} --adaptive-burst-loud-rate $DUMP1090_ADAPTIVE_BURST_LOUD_RATE"
fi
if [[ "$DUMP1090_ADAPTIVE_BURST_QUIET_RATE" != "" ]]; then
        echo "Setting Adaptive Burst Quiet to $DUMP1090_ADAPTIVE_BURST_QUIET_RATE" && dump1090configuration="${dump1090configuration} --adaptive-burst-quiet-rate $DUMP1090_ADAPTIVE_BURST_QUIET_RATE"
fi

if [[ "$DUMP1090_ADAPTIVE_MIN_GAIN" != "" ]]; then
        echo "Setting Adaptive Minimum Gain to $DUMP1090_ADAPTIVE_MIN_GAIN." && dump1090configuration="${dump1090configuration} --adaptive-min-gain $DUMP1090_ADAPTIVE_MIN_GAIN"
fi

if [[ "$DUMP1090_ADAPTIVE_MAX_GAIN" != "" ]]; then
        echo "Setting Adaptive Maximum Gain to $DUMP1090_ADAPTIVE_MAX_GAIN." && dump1090configuration="${dump1090configuration} --adaptive-max-gain $DUMP1090_ADAPTIVE_MAX_GAIN"
fi

if [[ "$DUMP1090_SLOW_CPU" != "" ]]; then
        echo "Setting Slow CPU mode to $DUMP1090_SLOW_CPU." && dump1090configuration="${dump1090configuration} --adaptive-duty-cycle $DUMP1090_SLOW_CPU"
fi

# Increase the allowed usbfs buffer size
echo 0 > /sys/module/usbcore/parameters/usbfs_memory_mb

# If using Mode-S Beast, launch beast-splitter in background
if [ "$radio_device_lower" = "modesbeast" ]
then
        /usr/bin/beast-splitter --serial /dev/ttyUSB0 --listen 30005:R --connect 0.0.0.0:30104:R 2>&1 | stdbuf -o0 sed --unbuffered '/^$/d' | awk -W interactive '{print "[beast-splitter]    "  $0}' &
elif [ "$radio_device_lower" = "airspy" ]
then    
	AIRSPY_ADSB_CMD="-l 30005:beast -c 0.0.0.0:30104:beast"
        if [ -n "$AIRSPY_ADSB_SERIAL" ]; then AIRSPY_ADSB_CMD+=" -s $AIRSPY_ADSB_SERIAL" && echo "Using Airspy with serial $AIRSPY_ADSB_SERIAL"; fi
        if [ -n "$AIRSPY_ADSB_GAIN" ]; then AIRSPY_ADSB_CMD+=" -g $AIRSPY_ADSB_GAIN" && echo "Airspy gain set to $AIRSPY_ADSB_GAIN"; fi
        if [ -n "$AIRSPY_ADSB_SAMPLE_RATE" ]; then AIRSPY_ADSB_CMD+=" -m $AIRSPY_ADSB_SAMPLE_RATE" && echo "Airspy sample rate set to $AIRSPY_ADSB_SAMPLE_RATE"; fi
        if [ "$AIRSPY_ADSB_BIASTEE" == "true" ]; then AIRSPY_ADSB_CMD+=" -b" && echo "Airspy bias tee enabled"; fi
        if [ "$AIRSPY_ADSB_STATS" == "true" ]; then 
	  AIRSPY_ADSB_CMD+=" -S /run/airspy_adsb/stats.json"
          ln -sf /etc/lighttpd/conf-available/87-airspy.conf /etc/lighttpd/conf-enabled/87-airspy.conf
	  echo "Airspy stats enabled in /run/airspy_adsb/stats.json"
	fi
        if [ "$AIRSPY_ADSB_OPTIONS" != "-v -t 90 -f 1 -e 4 -w 5 -P 8 -C 60 -E 20 -R rms -D 24,25,26,27,28,29,30,31" ]; then 
	  echo "Default AIRSPY_ADSB_OPTIONS settings overriden! New settings: $AIRSPY_ADSB_OPTIONS"
        fi
        /usr/bin/airspy_adsb $AIRSPY_ADSB_CMD $AIRSPY_ADSB_OPTIONS 2>&1 | stdbuf -o0 sed --unbuffered '/^$/d' | awk -W interactive '{print "[airspy]            "  $0}' &
fi

# Start dump1090-fa and put it in the background.
/usr/bin/dump1090-fa $dump1090configuration 2>&1 | stdbuf -o0 sed --unbuffered '/^$/d' | awk -W interactive '{print "[dump1090-fa]    "  $0}' &
  
# Start lighttpd and put it in the background.
/usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf 2>&1 | stdbuf -o0 sed --unbuffered '/^$/d' | awk -W interactive '{print "[lighttpd]    "  $0}' &

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
