#!/bin/bash
curl -s -o kafka-broker/etc/jmx_prometheus_javaagent.jar https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.9/jmx_prometheus_javaagent-0.9.jar
mkdir -p prometheus/data
mkdir -p fluentd/data
## grant write permission for non-root docker images
chmod a+w prometheus/data  ## prom/prometheus user `noboday (uid = 65534)`
chmod a+w fluentd/data     ## fluent/fluntd user `fluent (uid=)`
