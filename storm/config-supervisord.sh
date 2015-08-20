#!/usr/bin/env bash
echo [program:storm-$1] | tee -a /etc/supervisor.d/storm-$1.conf
echo command=storm $1 | tee -a /etc/supervisor.d/storm-$1.conf
echo directory=/home/storm | tee -a /etc/supervisor.d/storm-$1.conf
echo autorestart=true | tee -a /etc/supervisor.d/storm-$1.conf
echo user=root | tee -a /etc/supervisor.d/storm-$1.conf
