[client]
network_mode=true
key=${AIRNAV_RADAR_KEY}
lat=${LAT}
lon=${LON}
alt=${ALT}

[network]
mode=beast
external_host=${RECEIVER_HOST}
external_port=${RECEIVER_PORT}

[mlat]
autostart_mlat=true
mlat_cmd=/usr/local/share/mlat-client/venv/bin/mlat-client

[dump978]
dump978_enabled=${UAT_ANR_ENABLED}
dump978_port=30979