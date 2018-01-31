#!/bin/bash
rm -rf demo/grafana/data/
rm -rf demo/prometheus/data/
rm -rf demo/alertmanager/data/
rm -rf demo/fluentd/data
docker system prune --volumes -f
