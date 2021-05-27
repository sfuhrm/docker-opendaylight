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
    if [[ ${ODL_VERSION} =~ 0\.[0-9]*\.[0-9]* ]]; then
        java -jar bin/aaa-cli-jar.jar --dbd /odl/data --newUser admin --passwd "${ODL_ADMIN_PASSWORD}"
    else
        # add odl-aaa-cli
        sed -i -e"s/^featuresBoot = \([0-9a-fA-F-]*\)\$/featuresBoot = \1,odl-aaa-cli/" /odl/etc/org.apache.karaf.features.cfg
        # change password using new aaa:change-user-pwd method
        echo "aaa:change-user-pwd --userName admin -pass admin -newPass ${ODL_ADMIN_PASSWORD}" | bin/karaf
    fi
fi

bin/karaf ${KARAF_ARGS}
