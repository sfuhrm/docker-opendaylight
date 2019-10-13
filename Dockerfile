FROM anapsix/alpine-java:8_jdk

MAINTAINER Guillaume Lefevre <gelefevre@octo.com>

RUN mkdir /odl
WORKDIR /odl

RUN apk add --no-cache gcc g++ make libc-dev python-dev openssl && \
    apk add maven --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ && \
    wget https://nexus.opendaylight.org/content/groups/public/org/opendaylight/integration/distribution-karaf/0.5.0-Boron/distribution-karaf-0.5.0-Boron.tar.gz && \
    tar -xvzf distribution-karaf-0.5.0-Boron.tar.gz && \
    apk del gcc make python-dev libc-dev g++ maven && \
    rm -rf /var/cache/apk/*

EXPOSE 8181 6633 8101

CMD ./distribution-karaf-0.5.0-Boron/bin/karaf
