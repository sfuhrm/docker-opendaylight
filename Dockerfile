FROM jenkins:alpine

MAINTAINER Guillaume Lefevre <gelefevre@octo.com>

USER root

RUN apk -Uuv add python py-pip gcc python-dev musl-dev libffi libffi-dev openssl-dev groff py-boto && \
  	pip install awscli ansible && \
	  apk --purge -v del py-pip gcc && \
    rm -rf /var/cache/apk/*

USER jenkins

#apk add awscli --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ && \
#    apk add ansible --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/main/ && \
#    rm -rf /var/cache/apk/*
#apk add libffi libffi-dev --update-cache --repository fetch http://dl-cdn.alpinelinux.org/alpine/v3.4/edge/main/ && \
