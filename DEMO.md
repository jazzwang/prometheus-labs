- 記錄一下，如果使用 Google Cloud Platform 來進行 Demo 的步驟
1. 建立 Google Compute Engine 虛擬機器 ()
```
gcloud compute instances create prometheus-1 --zone=asia-east1-b --machine-type=c2-standard-4 --network=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --tags=http-server,https-server --image=debian-10-buster-v20201014 --image-project=debian-cloud --boot-disk-size=100GB --boot-disk-type=pd-standard --boot-disk-device-name=prometheus-1 --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any
```
2. 安裝 docker 跟 git
```bash
#!/bin/bash
## 安裝 docker-ce 跟 docker-compose
## https://docs.docker.com/engine/install/debian/
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose
sudo docker run hello-world
git clone https://github.com/jazzwang/prometheus-labs
cd prometheus-labs
sudo make init
sudo make test
```