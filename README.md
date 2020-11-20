# OpenDaylight controller

[![](https://img.shields.io/docker/pulls/sfuhrm/opendaylight?style=plastic)](https://hub.docker.com/repository/docker/sfuhrm/opendaylight/general)
[![](https://img.shields.io/docker/image-size/sfuhrm/opendaylight/latest?style=plastic)](https://hub.docker.com/repository/docker/sfuhrm/opendaylight/general)


OpenDaylight is an OpenFlow controller, useful to control and orchestrate a
network of switches that speak the openflow protocol on your infrastructure.

OpenDaylight supports other southbound protocols and can be integrated in Openstack or even Kubernetes.

More reading can be found here:

- [OpenDaylight Home](https://www.opendaylight.org/)
- [OpenDaylight Aluminium Documentation](https://docs.opendaylight.org/en/stable-aluminium/)

## Supported tags

- latest
- 0.13.1
- 0.13.0
- 0.12.2
- 0.12.1
- 0.12.0
- 0.11.4
- 0.11.3
- 0.11.2
- 0.11.1
- 0.10.3
- 0.10.2
- 0.10.1
- 0.10.0
- 0.9.3
- 0.9.2
- 0.9.1
- 0.9.0

## What's inside

- Based on [openjdk:11.0.9.1-slim-buster](https://hub.docker.com/_/openjdk).
- No module installed (you can connect to the CLI to set whatever module you want to use).
- Exposed TCP ports:
  - 6633 Openflow,
  - 8101 Karaf CLI via SSH (see below).

## How to use it

### Run container

`docker run -d -p 6633:6633 -p 8101:8101 --name=opendaylight sfuhrm/opendaylight`

### Access OpenDaylight karaf CLI

To access the Karaf CLI, issue the command

`ssh -p 8101 karaf@localhost`

The default SSH credentials are:

- Username: `karaf`
- Password: `karaf`

## Customization via ENV variables

The following environment variables can be set to customize the started
server:

| Variable                | Default   |  Possible Values |   |
|-------------------------|-----------|------------------|---|
| `KARAF_INTERACTIVE`     | `0`       | `0`,`1`              | Set to `1` to run Karaf interactive, meaning that the docker instance will be interactive. As an alternative, you can connect in a running server instance using `docker exec -ti opendaylight /odl/bin/client`  |
| `KARAF_FEATURES`        |           | string           | Comma separated features to load on boot of OpenDaylight. Example: `odl-yangtools-parser,odl-yangtools-parser-api` |
| `KARAF_USER`            | `karaf`   | string           | The user name of the Karaf service.  |
| `KARAF_PASSWORD`        | `karaf`   | string           | The password of the Karaf service.  |

Example:

```bash
docker run  -e KARAF_USER=michael -e KARAF_PASSWORD=knight -p 6633:6633 -p 8101:8101  --name=opendaylight sfuhrm/opendaylight:latest
```

## Credits

This is a fork of [Guillaume Lefevres](https://github.com/guillaumelfv/docker-opendaylight)
repository, but most things have changed.
