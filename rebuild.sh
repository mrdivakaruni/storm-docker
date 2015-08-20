#!/bin/bash

docker build -t="bala/base" base
docker build -t="bala/zookeeper" zookeeper
docker build -t="bala/storm" storm
docker build -t="bala/storm-nimbus" storm-nimbus
docker build -t="bala/storm-supervisor" storm-supervisor
docker build -t="bala/storm-ui" storm-ui
