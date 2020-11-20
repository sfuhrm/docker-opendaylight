#! /bin/bash

if [ ! -n "${KARAF_USER}" ]; then
    KARAF_USER=karaf
fi
if [ ! -n "${KARAF_PASSWORD}" ]; then
    KARAF_PASSWORD=karaf
fi
if [ -n "${KARAF_FEATURES}" ]; then
    sed -i -e"s/^featuresBoot = \([0-9a-fA-F-]*\)\$/featuresBoot = \1,${KARAF_FEATURES}/" /odl/etc/org.apache.karaf.features.cfg
fi

# replace karaf user and password
sed -i -e"s/karaf = [^,]*\(.*\)/${KARAF_USER} = ${KARAF_PASSWORD}\1/" /odl/etc/users.properties

cd /odl && bin/karaf server
