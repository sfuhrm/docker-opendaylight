#! /bin/bash

docker kill opendaylight
docker container rm opendaylight

docker run \
 -p 6633:6633 \
 -p 8101:8101  \
 -p 8181:8181  \
 --name=opendaylight sfuhrm/opendaylight:latest
