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

How to import ldfis
-------------------
First of all the system check ldif files in the following folder to import at databse level 0:
```
/etc/openldap/schema-ldif-includes/*.ldif
```
Then will check following directory for more ldifs:
```
/var/openldap-data/schema-ldif-includes/*.ldif
```
You should sort file names for importing by order in each folders.

Second the system check ldif files in the following folder to import at databse level 2:
```
/etc/openldap/ldif-imports/*.ldif
```
Then will check following directory for more ldifs:
```
/var/openldap-data/ldif-imports/*.ldif
```
You should sort file names for importing by order in each folders.


Github Repo
-----------
https://github.com/m-creations/docker-openwrt-ldap

