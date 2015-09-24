## -*- docker-image-name: "mcreations/openwrt-ldap" -*-

FROM mcreations/openwrt-x64
MAINTAINER Kambiz Darabi <darabi@m-creations.net>


ENV LDAP_BACKEND=mdb
#ENV SLAPD_USER=openldap
#ENV SLAPD_GROUP=openldap
ENV SLAPD_USER=root
ENV SLAPD_GROUP=root
ENV LDAP_ORGANIZATION=MyOrg

ADD image/root/ /

RUN /tmp/in-container-build && \
    rm /tmp/in-container-build

EXPOSE 389

CMD ["/start-slapd"]
