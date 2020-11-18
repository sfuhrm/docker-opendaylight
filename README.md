# OpenDaylight controller
[![](https://images.microbadger.com/badges/image/sfuhrm/opendaylight.svg)](https://microbadger.com/images/sfuhrm/opendaylight "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/sfuhrm/opendaylight.svg)](https://microbadger.com/images/sfuhrm/opendaylight "Get your own version badge on microbadger.com")

OpenDaylight is an OpenFlow controller, useful to control and orchestrate a
network of switches that speak the openflow protocol on your infrastructure.

OpenDaylight supports other southbound protocols and can be integrated in Openstack or even Kubernetes.

[OpenDaylight Home](https://www.opendaylight.org/)
[OpenDaylight Aluminium Documentation](https://docs.opendaylight.org/en/stable-aluminium/)

## Supported tags

- latest

## What's inside

- Based on [openjdk:11.0.9.1-slim-buster](https://hub.docker.com/_/openjdk).
- No module installed (you can connect to the CLI to set whatever module you want to use).
- Exposed TCP ports:
  - 6633 Openflow,
  - 8181 WebUI/REST api (see below),
  - 8101 Karaf CLI via SSH (see below).

## How to use it

### Run container

`docker run -d -p 6633:6633 -p 8181:8181 -p 8101:8101 --name=opendaylight sfuhrm/opendaylight`

### Access OpenDaylight karaf CLI

To access the Karaf CLI, issue the command

`ssh -p 8101 karaf@localhost`

The default SSH credentials are:

- Username: `karaf`
- Password: `karaf`

### Access Web interface

The web interface requires the Karaf feature to be installed:

`feature:install odl-dlux-all`

The site is then available using the URL

`http://localhost:8181/index.html`

The default credentials are:

- Username: `admin`
- Password: `admin`

## Credits

This is a fork of [Guillaume Lefevres](https://github.com/guillaumelfv/docker-opendaylight)
repository.

Changes to Guillaume's repo:

- The fork supports newer OpenDaylight versions (Guillaumes repo is fixed to use OpenDaylight 0.5.0 Boron).
- Using different Docker base image for JDK 11.
- Removing the tar-archive.
