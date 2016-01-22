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
ENV LDAP_ROOT=admin
ENV LDAP_ROOTPW=secret
ENV LDAP_REPLICATOR_PW=secret
ENV LDAP_MASTER_PW=secret
ENV REPLICATION_PROVIDER_URL ldaps://replication-provider:389

ADD image/root/ /

RUN mkdir -p /var/run/ &&\
    echo 'openldap:x:1000:1000::/home/openldap:' >>/etc/passwd &&\
    echo 'openldap:!:16702:0:99999:7:::' >>/etc/shadow &&\
    echo 'openldap:x:1000:' >>/etc/group &&\
    opkg update &&\
    opkg install openldap-server openldap-utils &&\
    rm /tmp/opkg-lists/*

EXPOSE 389

CMD ["/start-slapd"]
