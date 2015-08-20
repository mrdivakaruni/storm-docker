#!/bin/bash

docker build -t="mrdivakaruni/base" base
docker build -t="mrdivakaruni/zookeeper" zookeeper
docker build -t="mrdivakaruni/storm" storm
docker build -t="mrdivakaruni/storm-nimbus" storm-nimbus
docker build -t="mrdivakaruni/storm-supervisor" storm-supervisor
docker build -t="mrdivakaruni/storm-ui" storm-ui
