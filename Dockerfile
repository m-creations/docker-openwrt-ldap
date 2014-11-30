## -*- docker-image-name: "mcreations/openwrt-ldap" -*-

FROM mcreations/openwrt-x64
MAINTAINER Kambiz Darabi <darabi@m-creations.net>

ADD image/root/ /

RUN /tmp/in-container-build && \
    rm /tmp/in-container-build

EXPOSE 389

CMD ["/start-slapd"]
