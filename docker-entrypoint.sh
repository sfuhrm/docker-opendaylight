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
KARAF_ARGS="server"
if [ "1" == "${KARAF_INTERACTIVE}" ]; then
    KARAF_ARGS=""
fi
if [ -n "${ODL_LOGLEVEL}" ]; then
    cat >/odl/etc/org.ops4j.pax.logging.cfg  <<LOGGINGCONFIG
log4j2.pattern = %d{ISO8601} | %-5p | %-16t | %-32c{1} | %X{bundle.id} - %X{bundle.name} - %X{bundle.version} | %m%n
log4j2.rootLogger.level = ${ODL_LOGLEVEL}
log4j2.rootLogger.appenderRef.Console.ref = Console
log4j2.appender.console.type = Console
log4j2.appender.console.name = Console
log4j2.appender.console.layout.type = PatternLayout
log4j2.appender.console.layout.pattern = \${log4j2.pattern}
LOGGINGCONFIG
fi
if [ -n "${ODL_ADMIN_PASSWORD}" ]; then
    java -jar bin/aaa-cli-jar.jar --newUser admin --passwd "${ODL_ADMIN_PASSWORD}"
fi

# replace karaf user and password
sed -i -e"s/karaf = [^,]*\(.*\)/${KARAF_USER} = ${KARAF_PASSWORD}\1/" /odl/etc/users.properties

bin/karaf ${KARAF_ARGS}
