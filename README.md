# README

## How to run the demostration

```
~$ git clone https://github.com/jazzwang/prometheus-labs
~$ cd prometheus-labs
~/prometheus-labs$ make init; make test
```

Follow the instruction to learn from URLs

```
Creating prometheus ... done
Creating snmp-exporter ... done
Creating snmpd ... 
Creating snmp-exporter ... 
Creating client ... 
Creating grafana ... 

    Name                   Command               State               Ports            
--------------------------------------------------------------------------------------
client          /bin/sh                          Up                                   
grafana         /run.sh                          Up      0.0.0.0:3000->3000/tcp       
prometheus      /bin/prometheus --config.f ...   Up      0.0.0.0:9090->9090/tcp       
snmp-exporter   /bin/snmp_exporter --confi ...   Up      9116/tcp                     
snmpd           /bootstrap.sh                    Up      161/tcp, 0.0.0.0:161->161/udp

 ###############################################
 ### DEMO #1 -- Network Device Monintoring   ###
 ###############################################

 1.1      Prometheus Web UI 

    1.1.1 Targets               - http://localhost:9090/targets
    1.1.2 Current Configuration - http://localhost:9090/config
    1.1.3 Command-Line Flags    - http://localhost:9090/flags
    1.1.4 Alert Rules           - http://localhost:9090/rules
    1.1.5 Service Discovery     - http://localhost:9090/service-discovery
    1.1.6 Runtime Version       - http://localhost:9090/status
    1.1.7 Query & Graph         - https://goo.gl/5TmjWo

... Press Any Key to continue ...

 1.2      Grafana Web UI 

    1.2.1 Login                 - http://localhost:3000/login ( default: admin / admin )
    1.2.2 Add data source       - http://localhost:3000/datasources/new?gettingstarted
          - Name: Prometheus 
          - Type: Prometheus 
          - URL:  http://localhost:9090 
          - Access: direct 
          - Click 'Add' 
    1.2.3 import Dashboards     - http://localhost:3000/datasources/edit/1
    1.2.4 Prometheus Status     - http://localhost:3000/dashboard/db/prometheus-stats
    1.2.5 Grafana Status        - http://localhost:3000/dashboard/db/grafana-metrics
    1.2.6 import SNMP Dashboard 
          - http://localhost:3000/dashboard/new?editview=import ( upload 'demo/grafana/snmp.json' ) 

... Press Any Key to continue ...
   
 1.3      SNMP Exporter 

    1.3.1 Configuration         - https://github.com/prometheus/snmp_exporter 
                                  - input: snmp.yml 

    1.3.2 Understand Metrics    - docker exec -it client /bin/sh 
          # curl -s "http://snmp-exporter:9116/snmp?module=if_mib&target=snmpd" | grep -v '^#' | sort 

    1.3.1 Config Generator      - https://github.com/prometheus/snmp_exporter/tree/master/generator 
                                  - input:   generator.yml 
                                  - output:  snmp.yml 
                                  - command: './generator generate' 

... Press Any Key to continue ...

Stopping snmp-exporter ... done
Stopping snmpd         ... done
Creating node2 ... done
Creating node2 ... 

    Name                   Command                State             Ports         
----------------------------------------------------------------------------------
client          /bin/sh                          Up                               
grafana         /run.sh                          Up         0.0.0.0:3000->3000/tcp
node1           /bin/node_exporter               Up         9100/tcp              
node2           /bin/node_exporter               Up         9100/tcp              
prometheus      /bin/prometheus --config.f ...   Up         0.0.0.0:9090->9090/tcp
snmp-exporter   /bin/snmp_exporter --confi ...   Exit 2                           
snmpd           /bootstrap.sh                    Exit 137                         

 ###############################################
 ### DEMO #2 -- OS Level (Node) Monintoring  ###
 ###############################################

 2.1      Node Exporter 

    2.1.1 Configuration         - https://github.com/prometheus/node_exporter 

    2.1.2 Understand Metrics    - docker exec -it client /bin/sh 
          # curl -s http://node1:9100/metrics | grep -v '^#' | sort 

    2.1.3 import 'Node Exporter Full' Dashboard 
                                - http://localhost:3000/dashboard/new?editview=import ( id = 1860 ) 
    2.1.4 import 'Node Exporter Server Metrics' Dashboard 
                                - http://localhost:3000/dashboard/new?editview=import ( id = 405 ) 

... Press Any Key to continue ...

Stopping node2 ... done
Stopping node1 ... done
Creating kafka ... done
Creating fluentd ... done
Creating fluentd-exporter ... done
Creating kafka ... 
Creating kafka-exporter ... 
Creating fluentd ... 
Creating fluentd-exporter ... 

      Name                    Command                State                         Ports                     
-------------------------------------------------------------------------------------------------------------
client             /bin/sh                          Up                                                       
fluentd            /bin/entrypoint.sh /bin/sh ...   Up         24224/tcp, 5140/tcp                           
fluentd-exporter   fluentd_exporter -scrape_u ...   Up         9309/tcp                                      
grafana            /run.sh                          Up         0.0.0.0:3000->3000/tcp                        
kafka              supervisord -n                   Up         0.0.0.0:2181->2181/tcp, 0.0.0.0:9092->9092/tcp
kafka-exporter     /bin/kafka_exporter --kafk ...   Up         9308/tcp                                      
kafka-manager      ./start-kafka-manager.sh         Up         0.0.0.0:9000->9000/tcp                        
node1              /bin/node_exporter               Exit 2                                                   
node2              /bin/node_exporter               Exit 2                                                   
prometheus         /bin/prometheus --config.f ...   Up         0.0.0.0:9090->9090/tcp                        
snmp-exporter      /bin/snmp_exporter --confi ...   Exit 2                                                   
snmpd              /bootstrap.sh                    Exit 137                                                 

 ###############################################
 ### DEMO #3 -- Middleware Monintoring       ###
 ###############################################

 3.1      JMX Exporter 

    3.1.1 Configuration         - https://github.com/prometheus/jmx_exporter#configuration 
    3.1.2 Example (1) Kafka     - https://robustperception.io/monitoring-kafka-with-prometheus/ 
    3.1.3 Example (1) Cassandra - https://robustperception.io/monitoring-cassandra-with-prometheus/ 

... Press Any Key to continue ...

 3.2      Kafka Manager Web UI 

    3.2.1 Add Cluster           - http://localhost:9000/addCluster 
          - Cluster Name = Lab 
          - Cluster Zookeeper Hosts = kafka:2181 
          - Enable JMX Polling : CHECKED 
          - Clicke SAVE 
    3.2.2 Topic Throughput      - http://localhost:9000/clusters/Lab/topics/dummy 
    3.2.3 Consumer Status       - http://localhost:9000/clusters/Lab/consumers/dummy/topic/dummy/type/KF 

... Press Any Key to continue ...

 3.3      Grafana Web UI 

    3.3.1 import 'Kafka I/O' Dashboard 
          - http://localhost:3000/dashboard/new?editview=import ( upload 'demo/grafana/kafka.json ) 
    3.3.2 import 'Fluentd Output Health' Dashboard 
          - http://localhost:3000/dashboard/new?editview=import ( upload 'demo/grafana/fluentd.json ) 

... Press Any Key to continue ...

Stopping fluentd-exporter ... done
Stopping fluentd          ... done
Stopping kafka-exporter   ... done
Stopping kafka-manager    ... done
Stopping kafka            ... done

      Name                    Command                State             Ports         
-------------------------------------------------------------------------------------
client             /bin/sh                          Up                               
fluentd            /bin/entrypoint.sh /bin/sh ...   Exit 137                         
fluentd-exporter   fluentd_exporter -scrape_u ...   Exit 2                           
grafana            /run.sh                          Up         0.0.0.0:3000->3000/tcp
kafka              supervisord -n                   Exit 0                           
kafka-exporter     /bin/kafka_exporter --kafk ...   Exit 2                           
kafka-manager      ./start-kafka-manager.sh         Exit 143                         
node1              /bin/node_exporter               Exit 2                           
node2              /bin/node_exporter               Exit 2                           
prometheus         /bin/prometheus --config.f ...   Up         0.0.0.0:9090->9090/tcp
snmp-exporter      /bin/snmp_exporter --confi ...   Exit 2                           
snmpd              /bootstrap.sh                    Exit 137     
```

Cleaning up intermediate files and folders

```
~/prometheus-labs$ make clean      ## just clean up intermedia folders and run docker system prune
~/prometheus-labs$ make distclean  ## clean up all intermedia files
```

## Slides

<div style="margin-bottom:5px"> <strong> <a href="//www.slideshare.net/jazzwang/full-stack-monitoring-with-prometheus-and-grafana" title="Full Stack Monitoring with Prometheus and Grafana" target="_blank">Full Stack Monitoring with Prometheus and Grafana</a> </strong> from <strong><a href="https://www.slideshare.net/jazzwang" target="_blank">Jazz Yao-Tsung Wang</a></strong> </div>


[![Link to Slideshare](https://image.slidesharecdn.com/fullstackmonitoringwithprometheus-180210035113/95/full-stack-monitoring-with-prometheus-and-grafana-1-638.jpg?cb=1518234875)](https://www.slideshare.net/jazzwang/full-stack-monitoring-with-prometheus-and-grafana)

* 時間：2018-02-10 台灣資料工程協會 2018 第一季技術工作坊
* 講題：使用普羅米修斯打造全棧式監控與告警平台 Building Full Stack Monitor and Notification with Prometheus
* 摘要：

<div>
身為管理混合式雲端基礎建設的維運人員，面對分散在不同監控平台的數據是否感到頭疼呢？身為開發者，您是否苦於欠缺歷史監控數據來除錯或排查程式效能問題呢？本次分享將從動機面開始說明為何需要全棧式監控與告警平台，接著介紹過去一季講者如何使用普羅米修斯（Prometheus）與 Grafana 針對網路層、實體機器、虛擬機器、容器、中介軟體層（Ex. Apache Cassandra、Apache Kafka、CNCF Fluentd）、應用程式層來建立資料串流（Data Pipeline）的監控儀表板。礙於無法展示真實公司的環境，本分享將使用 Docker Compose 進行全棧式監控與告警平台的概念，也藉此逐一介紹搭建全棧式監控與告警平台會用到哪些普羅米修斯（Prometheus）的各類資料蒐集器（Exporter）。

As a Hybrid Cloud Operator, are you tired of collecting monitor metrics from different monitor services? As a Developer, do you need historical application and infrastructure metrics to debug or improve application performance? In this talk, I'll first talk about why should we build Full Stack Monitor and Notification with Prometheus and Grafana. I'll share my personal experience about monitoring network devices, physical machines, virtual machines, docker containers, Middleware (Ex. Apache Cassandra, Apapche Kafka, CNCF Fluentd) and Application metrics. I'll demonstrate an End-to-End Data Pipeline Dashboard with Docker Compose examples and introduce different kinds of Prometheus Exporter used for different monitor targets. 
</div>
