#! /bin/bash

BASEDIR=$(cd $(dirname "$0"); cd ..; pwd)
DOCKERFILE_PATH=${BASEDIR}/Dockerfile
IMAGE_NAME=sfuhrm/opendaylight:latest

$BASEDIR/hooks/build
