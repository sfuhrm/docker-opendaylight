FROM openjdk:11.0.9.1-slim-buster

LABEL maintainer="stephan.fuhrmann@ionos.com"

RUN mkdir /odl
WORKDIR /odl

COPY .version /version
RUN apt-get update && apt-get install -y --no-install-recommends wget && \
# apt-get install -y --no-install-recommends net-tools && \
  wget https://nexus.opendaylight.org/content/repositories/opendaylight.release/org/opendaylight/integration/opendaylight/$(cat /version)/opendaylight-$(cat /version).tar.gz -O- | \
  tar -xvzf- && \
  apt-get remove -y wget && \
  rm -rf /var/lib/apt/lists/*
EXPOSE 8181 6633 8101

CMD ./opendaylight-$(cat /version)/bin/karaf server
