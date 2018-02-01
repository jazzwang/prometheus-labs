#!/bin/bash
curl -s -o demo/kafka-broker/jmx_prometheus_javaagent.jar https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.9/jmx_prometheus_javaagent-0.9.jar
cp demo/kafka-broker/jmx_prometheus_javaagent.jar demo/cassandra/jmx_prometheus_javaagent.jar
mkdir -p demo/alertmanager/data
mkdir -p demo/prometheus/data
mkdir -p demo/grafana/data
mkdir -p demo/cassandra
mkdir -p demo/fluentd/data
