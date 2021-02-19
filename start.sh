#!/bin/bash

set -eu

echo "=> sending config"

if [ ! -f "/app/data/influxd.conf" ]; then
	cp /app/code/influxd.conf /app/data/influxd.conf
fi
export INFLUXD_CONFIG_PATH=/app/data

if [ ! -f "/app/data/.configured" ]; then
	mkdir -p /app/data/influx/data /app/data/influx/meta /app/data/influx/wal
	touch /app/data/.configured
fi
echo "=> starting influxdb"
exec "/app/code/influxd" -config /app/data/influxd.conf
