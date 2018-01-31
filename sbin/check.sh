#!/bin/bash
if [ "$(which curl)" == "" ]; then echo "Please install `curl`"; exit -1; fi
if [ "$(which docker)" == "" ]; then echo "Please install `docker`"; exit -1; fi
if [ "$(which docker-compose)" == "" ]; then echo "Please install `docker-compose`"; exit -1; fi
