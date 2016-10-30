# Opendaylight controller
[![](https://images.microbadger.com/badges/image/glefevre/opendaylight.svg)](https://microbadger.com/images/glefevre/opendaylight "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/glefevre/opendaylight.svg)](https://microbadger.com/images/glefevre/opendaylight "Get your own version badge on microbadger.com")

*(SDN Openflow Controller)*

Opendaylight is an OpenFlow controller, usefull to control and orchestrate network of switches that speak the openflow protocol on your infrastructure.

It support others southbound protocol and can be integrated in Openstack or even Kubernetes.

[Opendaylight Home](https://www.opendaylight.org/)
[Opendaylight Boron Documentation](http://docs.opendaylight.org/en/stable-boron/index.html)

## Supported tags
- latest

## What's inside ?
- Based on anapsix/alpine-java:8_jdk
- No module installed (you can connect to the CLI to set whatever module you want to use)
- Exposed port 6633 (Openflow), 8181 (WebUI/REST api) & 8101 (karaf CLI)

## How to use it ?
### Run container
`docker run -d -p 6633:6633 -p 8181:8181 -p 8101:8101 --name=opendaylight glefevre/opendaylight`

### Access Opendaylight karaf CLI
`ssh -p 8101 karaf@localhost`
*Default password is "karaf"*

### Access Web interface
`http://localhost:8181/index.html`
