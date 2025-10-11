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

missing_variables="false"
adsb="false"
mlat="false"
adsb_exchange="false"

# Check for ADSB_EXCHANGE_ENABLE_ALL or ADSB_EXCHANGE_ENABLE_ALL_BUT_ADSBX environment variables.

check_true () {
	lowercase=$(echo "${!1}" | tr '[:upper:]' '[:lower:]')
	if [ "$lowercase" = "true" ] || [ "$lowercase" = "enabled" ] || [ "$lowercase" = "on" ] || \
           [ "$lowercase" = "1" ] || [ "$lowercase" = "enable" ] || [ "$lowercase" = "yes" ] || \
	   [ "$lowercase" = "y" ]
	then
 		eval "$1"="true"
   		echo "${!1}"
	else
 		eval "$1"="false"
   		echo "${!1}"
   	fi
}

if [ $(check_true ADSB_EXCHANGE_ENABLE_ALL) != "true" ] && [ $(check_true ADSB_EXCHANGE_ENABLE_ALL_BUT_ADSBX) != "true" ]
then
	ADSB_EXCHANGE_ENABLE="true"
fi

if [ $(check_true ADSB_EXCHANGE_ENABLE_ALL) = "true" ]
then
	ADSB_EXCHANGE_ENABLE="true"
	ADSB_FI_ENABLE="true"
	ADSB_LOL_ENABLE="true"
	ADSB_ONE_ENABLE="true"
	AIRPLANES_LIVE_ENABLE="true"
	PLANESPOTTERS_ENABLE="true"
	THE_AIR_TRAFFIC_ENABLE="true"
	AV_DELPHI_ENABLE="true"
	SKYFEED_HPRADAR_ENABLE="true"
	FLY_ITALY_ADSB_ENABLE="true"
fi

if [ $(check_true ADSB_EXCHANGE_ENABLE_ALL_BUT_ADSBX) = "true" ]
then
	ADSB_EXCHANGE_ENABLE="false"
	ADSB_FI_ENABLE="true"
	ADSB_LOL_ENABLE="true"
	ADSB_ONE_ENABLE="true"
	AIRPLANES_LIVE_ENABLE="true"
	PLANESPOTTERS_ENABLE="true"
	THE_AIR_TRAFFIC_ENABLE="true"
	AV_DELPHI_ENABLE="true"
	SKYFEED_HPRADAR_ENABLE="true"
	FLY_ITALY_ADSB_ENABLE="true"
fi

# Begin defining all the required configuration variables.

[ -z "$LAT" ] && echo "Receiver latitude is missing, will abort startup." && missing_variables="true" || echo "Receiver latitude is set: $LAT"
[ -z "$LON" ] && echo "Receiver longitude is missing, will abort startup." && missing_variables="true" || echo "Receiver longitude is set: $LON"
[ -z "$ALT" ] && echo "Receiver altitude is missing, will abort startup." && missing_variables="true" || echo "Receiver altitude is set: $ALT"
[ -z "$RECEIVER_HOST" ] && echo "Receiver host is missing, will abort startup." && missing_variables="true" || echo "Receiver host is set: $RECEIVER_HOST"
[ -z "$RECEIVER_PORT" ] && echo "Receiver port is missing, will abort startup." && missing_variables="true" || echo "Receiver port is set: $RECEIVER_PORT"

# Set UUID file
if [[ -f /run/uuid ]]
then
	echo "UUID file found at /run/uuid."
	UUID_FILE="/run/uuid"
 	UUID=$(cat /run/uuid)
elif [[ -n "${ADSB_EXCHANGE_UUID}" ]] && [ $(check_true ADSB_EXCHANGE_ENABLE) = "true" ]
then
	echo "ADSB Exchange UUID set. Using this UUID for all services."
 	echo "Saving UUID to file /run/uuid."
	echo "$ADSB_EXCHANGE_UUID" > /run/uuid
 	UUID_FILE="/run/uuid"
 	UUID=$(cat /run/uuid)
elif [[ -n "${UUID}" ]]
then
	echo "UUID set. Using this UUID for all services."
 	echo "Saving UUID to file /run/uuid."
	echo "$UUID" > /run/uuid
 	UUID_FILE="/run/uuid"
else
	echo "UUID is not set. Generating random UUID."
 	UUID=$(cat /proc/sys/kernel/random/uuid)
	echo "UUID is set: $UUID"
	echo "$UUID" > /run/uuid
	UUID_FILE="/run/uuid"
fi

# Create lists
ADSB_NET_CONNECTOR=()
MLAT_SERVER=()

if [ $(check_true ADSB_EXCHANGE_ENABLE) = "true" ]
then
	if [ -z "$ADSB_EXCHANGE_SITENAME" ]
 	then
 		echo "ADS-B Exchange username is missing, will abort startup."
   		adsb_exchange="false"
     	else 
      		echo "ADS-B Exchange username is set: $ADSB_EXCHANGE_SITENAME"
      		adsb_exchange="true"
	fi
	if [ -z "$ADSB_EXCHANGE_UUID" ]
 	then
 		echo "ADS-B Exchange UUID is missing, will abort startup."
   		adsb_exchange="false"
     	else
      		echo "ADS-B Exchange UUID is set: $ADSB_EXCHANGE_UUID"
		adsb_exchange="true"
  	fi
 	if [ "$adsb_exchange" = "true" ]
	then
         	echo "All ADS-B Exchange parameters set. ADS-B Exchange service enabled."
        	adsb="true"
	 	mlat="true"
   		ADSB_NET_CONNECTOR+=("--net-connector=feed1.adsbexchange.com,30004,beast_reduce_plus_out,feed2.adsbexchange.com,64004")
     		MLAT_SERVER+=("--server=feed.adsbexchange.com:31090")
	fi
else
	echo "ADSB Exchange disabled, skipping."
 	adsb_exchange="false"
fi

if [ -z "$ADSB_FI_ENABLE" ]
then
	echo "Adsb.fi disabled, skipping."
else
	echo "Adsb.fi service enabled."
 	adsb="true"
  	mlat="true"
	ADSB_NET_CONNECTOR+=("--net-connector=feed.adsb.fi,30004,beast_reduce_plus_out")
     	MLAT_SERVER+=("--server=feed.adsb.fi:31090")
      	# MLAT_SERVER+=("--results beast,listen,39000")
fi
if [ -z "$ADSB_LOL_ENABLE" ]
then
	echo "Adsb.lol disabled, skipping."
else
	echo "Adsb.lol service enabled."
 	adsb="true"
  	mlat="true"
	ADSB_NET_CONNECTOR+=("--net-connector=in.adsb.lol,30004,beast_reduce_plus_out")
     	MLAT_SERVER+=("--server=in.adsb.lol:31090")
      	# MLAT_SERVER+=("--results beast,listen,39001")
fi
if [ -z "$ADSB_ONE_ENABLE" ]
then
	echo "ADS-B One disabled, skipping."
else
	echo "ADS-B One service enabled."
 	adsb="true"
  	mlat="true"
	ADSB_NET_CONNECTOR+=("--net-connector=feed.adsb.one,64004,beast_reduce_plus_out,feed.adsb.one,64005")
     	MLAT_SERVER+=("--server=feed.adsb.one:64006")
      	# MLAT_SERVER+=("--results beast,listen,39001")
fi
if [ -z "$AIRPLANES_LIVE_ENABLE" ]
then 
	echo "Airplanes.live disabled, skipping."
else
	echo "Airplanes.live service enabled."
 	adsb="true"
  	mlat="true"
	ADSB_NET_CONNECTOR+=("--net-connector=feed.airplanes.live,30004,beast_reduce_plus_out")
     	MLAT_SERVER+=("--server=feed.airplanes.live:31090")
      	# MLAT_SERVER+=("--results beast,listen,39002")
fi
if [ -z "$PLANESPOTTERS_ENABLE" ]
then
	echo "Planespotters disabled, skipping."
 else
	echo "Planespotters service enabled."
 	adsb="true"
  	mlat="true"
	ADSB_NET_CONNECTOR+=("--net-connector=feed.planespotters.net,30004,beast_reduce_plus_out")
     	MLAT_SERVER+=("--server=mlat.planespotters.net:31090")
      	# MLAT_SERVER+=("--results beast,listen,39003")
fi
if [ -z "$THE_AIR_TRAFFIC_ENABLE" ]
then
	echo "TheAirTraffic disabled, skipping."
else
	echo "TheAirTraffic service enabled."
 	adsb="true"
  	mlat="true"
	ADSB_NET_CONNECTOR+=("--net-connector=feed.theairtraffic.com,30004,beast_reduce_plus_out")
     	MLAT_SERVER+=("--server=feed.theairtraffic.com:31090")
      	# MLAT_SERVER+=("--results beast,listen,39004")
fi
if [ -z "$AV_DELPHI_ENABLE" ]
then
	echo "AvDelphi disabled, skipping."
 else
	echo "AvDelphi service enabled."
 	adsb="true"
	ADSB_NET_CONNECTOR+=("--net-connector=data.avdelphi.com,24999,beast_reduce_plus_out")
fi
if [ -z "$SKYFEED_HPRADAR_ENABLE" ]
then
	echo "HP Radar SkyFeed disabled, skipping."
 else
	echo "HP Radar SkyFeed service enabled."
 	adsb="true"
  	mlat="true"
	ADSB_NET_CONNECTOR+=("--net-connector=skyfeed.hpradar.com,30004,beast_reduce_plus_out")
     	MLAT_SERVER+=("--server=skyfeed.hpradar.com:31090")
      	# MLAT_SERVER+=("--results beast,listen,39005")
fi
if [ -z "$FLY_ITALY_ADSB_ENABLE" ]
then
	echo "Fly Italy Adsb disabled, skipping."
 else
	echo "Fly Italy Adsb service enabled."
 	adsb="true"
  	mlat="true"
	ADSB_NET_CONNECTOR+=("--net-connector=dati.flyitalyadsb.com,4905,beast_reduce_plus_out")
     	MLAT_SERVER+=("--server=dati.flyitalyadsb.com:30100")
      	# MLAT_SERVER+=("--results beast,listen,39007")
fi

# End defining all the required configuration variables.

echo " "

if [ "$missing_variables" = "true" ]
then
        echo "Required settings missing, aborting..."
        echo " "
        balena-idle
fi

if [ "$adsb" = "false" ] && [ "$mlat" = "false" ] && [ "$adsb_exchange" = "false" ]
then
        echo "No services activated, aborting..."
        echo " "
        balena-idle
fi

if [ "$adsb" = "false" ]
then
        echo "All ADS-B feeds disabled, skipping..."
        echo " "
fi

if [ "$mlat" = "false" ]
then
        echo "All MLAT feeds disabled, skipping..."
        echo " "
fi

if [ "$adsb_exchange" = "false" ]
then
        echo "Missing ADS-B Exchange credentials, skipping..."
        echo " "
fi

echo "Settings verified, proceeding with startup."
echo " "

# Variables are verified – continue with startup procedure.

if [ "$adsb" = "true" ]
then
	/usr/bin/feed-adsbx --net --net-only --debug=n --quiet --uuid-file="${UUID_FILE}" --write-json /run/adsbexchange-feed "${ADSB_NET_CONNECTOR[@]}" --net-beast-reduce-interval 0.5 --net-heartbeat 60 --net-ro-size 1280 --net-ro-interval 0.2 --net-ro-port 0 --net-sbs-port 0 --net-bi-port 30154 --net-bo-port 0 --net-ri-port 0 --net-connector "$RECEIVER_HOST","$RECEIVER_PORT",beast_in --lat "$LAT" --lon "$LON" 2>&1 | stdbuf -o0 sed --unbuffered '/^$/d' |  awk -W interactive '{print "[feed-adsbx]     " $0}' &
fi

if [ "$mlat" = "true" ]
then
	for CMD in "${MLAT_SERVER[@]}"
	do
		/usr/local/share/adsbexchange/venv/bin/mlat-client --input-type dump1090 --no-udp --input-connect "$RECEIVER_HOST":"$RECEIVER_PORT" "${CMD}" --user "$ADSB_EXCHANGE_SITENAME" --lat "$LAT" --lon "$LON" --alt "$ALT" --results beast,connect,"$RECEIVER_HOST":30104 --results basestation,listen,31003 --results beast,listen,30157 2>&1 | stdbuf -o0 sed --unbuffered '/^$/d' | awk -W interactive '{print "[mlat-client]    "  $0}' &
  	done
fi

if [ "$adsb_exchange" = "true" ]
then
	# Write settings to config file and set permissions.
	envsubst < /boot/adsbx-uuid.tpl > /boot/adsbx-uuid
	chmod a+rw /boot/adsbx-uuid

	echo "Feeder page: https://www.adsbexchange.com/api/feeders/?feed=$(cat /boot/adsbx-uuid)"
	echo " "
	/usr/local/share/adsbexchange-stats/json-status 2>&1 | stdbuf -o0 sed --unbuffered '/^$/d' | awk -W interactive '{print "[json-status]    " $0}' | grep -v 'jq: error' &
fi

# If UAT is enabled through config, enable feeding of UAT data to ADSB Exchange.
if [[ "$UAT_ENABLED" = "true" ]] && [ "$adsb_exchange" = "true" ]; then
	/usr/bin/feed-adsbx --net-only --net --net-heartbeat 60 --net-ro-size 1280 --net-ro-interval 0.2 --net-ri-port 37981 --net-bo-port 37985 --net-connector feed.adsbexchange.com,30004,beast_reduce_out,feed.adsbexchange.com,64004 --write-json /run/adsbexchange-978 --quiet 2>&1 | stdbuf -o0 sed --unbuffered '/^$/d' | awk -W interactive '{print "[feed-adsbx-uat] " $0}' &
	/usr/local/share/adsbexchange-978/convert.sh 2>&1 | stdbuf -o0 sed --unbuffered '/^$/d' | awk -W interactive '{print "[uat2esnt]       " $0}' &
fi

# Wait for any services to exit.
wait -n
