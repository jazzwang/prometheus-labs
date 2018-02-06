#!/bin/bash
cd demo
docker-compose up -d prometheus grafana snmpd snmp-exporter
docker-compose ps
echo ""
echo "[1;32m ######[0m"
echo "[1;32m ### DEMO #1 -- Network Device Monintoring   ###[0m"
echo "[1;32m ######[0m"
echo ""
echo "[1;33m 1.1      Prometheus Web UI[0m"
echo ""
echo "[1;33m    1.1.1 Targets               - http://localhost:9090/targets[0m"
echo "[1;33m    1.1.2 Current Configuration - http://localhost:9090/config[0m"
echo "[1;33m    1.1.3 Command-Line Flags    - http://localhost:9090/flags[0m"
echo "[1;33m    1.1.4 Alert Rules           - http://localhost:9090/rules[0m"
echo "[1;33m    1.1.5 Service Discovery     - http://localhost:9090/service-discovery[0m"
echo "[1;33m    1.1.6 Runtime Version       - http://localhost:9090/status[0m"
echo "[1;33m    1.1.7 Query & Graph         - https://goo.gl/5TmjWo[0m"
echo ""
echo "... Press Any Key to continue ..."
read
echo ""
echo "[1;33m 1.2      Grafana Web UI[0m"
echo ""
echo "[1;33m    1.2.1 Login                 - http://localhost:3000/login ( default: admin / admin )[0m"
echo "[1;33m    1.2.2 Add data source       - http://localhost:3000/datasources/new?gettingstarted[0m"
echo "[1;33m    1.2.3 import Dashboards     - http://localhost:3000/datasources/edit/1[0m"
echo "[1;33m    1.2.4 Prometheus Status     - http://localhost:3000/dashboard/db/prometheus-stats[0m"
echo "[1;33m    1.2.5 Grafana Status        - http://localhost:3000/dashboard/db/grafana-metrics[0m"
echo "[1;33m    1.2.6 import SNMP Dashboard - http://localhost:3000/dashboard/new?editview=import ( id = 1124 ) [0m"
echo ""
echo "... Press Any Key to continue ..."
read
docker-compose up -d node1 node2
docker-compose ps
echo ""
echo "[1;33m 1.3      Node Exporter Metrics[0m"
echo ""
echo "[1;33m    1.3.1 import 'Node Exporter Full' Dashboard [0m"
echo "[1;33m                                - http://localhost:3000/dashboard/new?editview=import ( id = 1860 ) [0m"
echo "[1;33m    1.3.2 import 'Node Exporter Server Metrics' Dashboard [0m"
echo "[1;33m                                - http://localhost:3000/dashboard/new?editview=import ( id = 405 ) [0m"
