# InfluxDB Cloudron App Packaging

* This packages InfluxDB 2.x running internall on port 8086
* Healthcheck is to /metrics which some may find questionable
* Externally, the app is published via 443, so defaulting influx client to 8086 will be problematic

## Customizations

* OOTB, this app does nothing.
* from Terminal in /app/code run ./influx and get started with stuff
