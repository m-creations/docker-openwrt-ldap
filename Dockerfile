## -*- docker-image-name: "mcreations/openwrt-ldap" -*-

FROM mcreations/openwrt-x64
MAINTAINER Kambiz Darabi <darabi@m-creations.net>


ENV LDAP_BACKEND=mdb
#ENV SLAPD_USER=openldap
#ENV SLAPD_GROUP=openldap
ENV SLAPD_USER=root
ENV SLAPD_GROUP=root
ENV LDAP_ORGANIZATION=MyOrg
ENV SLAPD_DEBUG_LEVEL=1
ENV LAPDTOOLS_DEBUG_LEVEL=2048
ENV LDAP_ROOT=Manager
ENV LDAP_ROOTPW=secret
ENV LDAP_REPLICATOR_PW=secret
ENV LDAP_MASTER_PW=secret
ENV REPLICATION_PROVIDER_URL ldaps://replication-provider-server:389

ADD image/root/ /

RUN /tmp/in-container-build && \
    rm /tmp/in-container-build

EXPOSE 389

CMD ["/start-slapd"]
