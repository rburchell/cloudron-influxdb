#!/bin/bash

set -eu

echo "=> sending config"

if [ ! -f "/app/data/config.json" ]; then 
	cp /app/code/config.json /app/data/config.json
fi
export INFLUXD_CONFIG_PATH=/app/data

if [ ! -f "/app/data/.configured" ]; then
	mkdir -p /app/data/influx/data /app/data/influx/meta /app/data/influx/wal
	touch /app/data/.configured
fi
export INFLUXD_CONFIG_PATH=/app/data/config.json
echo "=> starting influxdb"
exec "/app/code/influxd"
