ARG PARENT_IMAGE=openjdk:11.0.9.1-slim-buster
FROM $PARENT_IMAGE

LABEL maintainer="stephan.fuhrmann@ionos.com"

RUN mkdir /odl
WORKDIR /odl

ARG ODL_VERSION=0.13.1
ARG DISTRIBUTION_URL=https://nexus.opendaylight.org/content/repositories/opendaylight.release/org/opendaylight/integration/opendaylight/$ODL_VERSION/opendaylight-$ODL_VERSION.tar.gz

COPY docker-entrypoint.sh /docker-entrypoint.sh

# wget is just used for fetching the tar.gz on build time
# procps is used by the karaf shell script
RUN apt-get update && apt-get install -y --no-install-recommends wget procps && \
  wget -O- $DISTRIBUTION_URL | \
  tar -xzf- --strip-components 1 && \
  apt-get remove -y wget && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/* /var/cache/apt && \
  useradd --home-dir /odl odl && \
  chown -R odl:odl /odl
EXPOSE 6633 8101 8181

USER odl

CMD ["/docker-entrypoint.sh"]
