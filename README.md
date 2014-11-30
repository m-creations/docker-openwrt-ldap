docker-openwrt-ldap
===================

A docker image for openldap based on OpenWrt x86_64 which writes data to

* `/var/openldap-data`

How to use
----------

Give it two env vars:

* `LDAP_DOMAIN`
* `LDAP_ROOTPW`

and a volume to store the data:

```
docker run -e LDAP_DOMAIN=example.com \
           -e LDAP_ROOTPW=secret \
	   -v /share/ldap/example.com:/var/openldap-data \
	   mcreations/openwrt-ldap
```

Github Repo
-----------

https://github.com/m-creations/docker-openwrt-ldap

