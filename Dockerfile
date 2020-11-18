FROM openjdk:11.0.9.1-slim-buster

LABEL maintainer="stephan.fuhrmann@ionos.com"

RUN mkdir /odl
WORKDIR /odl

ENV ODL_VERSION=0.13.1
RUN apt-get update && apt-get install -y --no-install-recommends wget && \
# apt-get install -y --no-install-recommends net-tools && \
  wget https://nexus.opendaylight.org/content/repositories/opendaylight.release/org/opendaylight/integration/opendaylight/${ODL_VERSION}/opendaylight-${ODL_VERSION}.tar.gz -O- | \
  tar -xvzf- && \
  apt-get remove -y wget && \
  rm -rf /var/lib/apt/lists/*
EXPOSE 8181 6633 8101

CMD ./opendaylight-${ODL_VERSION}/bin/karaf server
