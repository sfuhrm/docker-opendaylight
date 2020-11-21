FROM openjdk:11.0.9.1-slim-buster

LABEL maintainer="stephan.fuhrmann@ionos.com"

RUN mkdir /odl
WORKDIR /odl

ARG ODL_VERSION=0.13.1

COPY docker-entrypoint.sh /docker-entrypoint.sh

# wget is just used for fetching the tar.gz on build time
# procps is used by the karaf shell script
RUN apt-get update && apt-get install -y --no-install-recommends wget procps && \
  wget https://nexus.opendaylight.org/content/repositories/opendaylight.release/org/opendaylight/integration/opendaylight/$ODL_VERSION/opendaylight-$ODL_VERSION.tar.gz -O- | \
  tar -xzf- --strip-components 1 && \
  apt-get remove -y wget && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/* /var/cache/apt && \
  chmod a+x /docker-entrypoint.sh
EXPOSE 6633 8101

CMD /docker-entrypoint.sh
