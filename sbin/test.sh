#!/bin/bash
docker-compose up -d
docker-compose ps
echo "[1;33m 1.1      Kafka Manager Web UI [0m"
echo ""
echo "[1;33m    1.1.1 Add Cluster           - http://localhost:9000/addCluster [0m"
echo "[1;33m          - Cluster Name = Lab [0m"
echo "[1;33m          - Cluster Zookeeper Hosts = kafka:2181 [0m"
echo "[1;33m          - Enable JMX Polling : CHECKED [0m"
echo "[1;33m          - Clicke "SAVE" [0m"
echo "[1;33m    1.1.2 Topic Throughput      - http://localhost:9000/clusters/Lab/topics/dummy [0m"
echo "[1;33m    1.1.3 Consumer Status       - http://localhost:9000/clusters/Lab/consumers/dummy/topic/dummy/type/KF [0m"
echo ""
