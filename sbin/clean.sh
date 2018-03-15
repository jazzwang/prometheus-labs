#!/bin/bash
rm -rf prometheus/data/
rm -rf fluentd/data
docker system prune --volumes -f
