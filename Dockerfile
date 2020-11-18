FROM openjdk:11.0.9.1-slim-buster

LABEL maintainer="stephan.fuhrmann@ionos.com"

RUN mkdir /odl
WORKDIR /odl

COPY .version /version
RUN apt-get update && apt-get install -y --no-install-recommends wget && \
# apt-get install -y --no-install-recommends net-tools && \
  wget https://nexus.opendaylight.org/content/repositories/opendaylight.release/org/opendaylight/integration/opendaylight/$(cat /version)/opendaylight-$(cat /version).tar.gz -O- | \
  tar -xvzf- --strip-components 1 && \
  apt-get remove -y wget && \
  apt-get autoremove && \
  rm -rf /var/lib/apt/lists/* /var/cache/apt
EXPOSE 8181 6633 8101

CMD ./bin/karaf server
