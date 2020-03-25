#!/bin/bash

set -x
mkdir -p /home/student/projects/tig/data/influxdb
mkdir -p /home/student/projects/tig/data/grafana
mkdir -p /home/student/projects/tig/log/grafana
#mkdir -p /home/student/projects/tig/conf/grafana/
#touch /home/student/projects/tig/conf/grafana/grafana.ini
mkdir -p /home/student/projects/tig/data/mqtt/
mkdir -p /home/student/projects/tig/log/mqtt/
#touch /home/student/projects/tig/log/mqtt/mosquitto.log
sudo chmod 777 -R /home/student/projects/tig/
set +x
