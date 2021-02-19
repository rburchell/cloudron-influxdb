FROM influxdb:1.8.4 as final

FROM cloudron/base:2.0.0@sha256:f9fea80513aa7c92fe2e7bf3978b54c8ac5222f47a9a32a7f8833edf0eb5a4f4
COPY --from=final /usr/bin/influxd /app/code/influxd
COPY --from=final /usr/bin/influx /app/code/influx

ADD --chown=cloudron:cloudron start.sh influxd.conf /app/code/

EXPOSE 8086
RUN mkdir -p /app/data && chown -R cloudron:cloudron /app/data && chmod +x /app/code/start.sh
WORKDIR /app/data
RUN mkdir -p /root/.influxdb && ln -s /app/data/influx/data /root/.influxdb && ln -s /app/data/influx/meta /root/.influxdb && ln -s /app/data/influx/wal /root/.influxdb && ln -s /app/data/.influxhistory /root/.influx_history
CMD [ "/app/code/start.sh" ]

