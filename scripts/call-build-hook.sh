#! /bin/bash

BASEDIR=$(cd $(dirname "$0"); cd ..; pwd)
export DOCKERFILE_PATH=${BASEDIR}/Dockerfile
export IMAGE_NAME=sfuhrm/opendaylight:latest
export DOCKER_TAG=latest

$BASEDIR/hooks/build
