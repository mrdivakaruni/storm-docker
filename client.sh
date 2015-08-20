#!/bin/sh
docker run -i -t --link balastorm_nimbus_1:nimbus  -p 22 bala/storm /bin/bash