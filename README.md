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
First of all after importing the base of ldap the system check ldif files in the following folder to import at database level 0:
```
/etc/openldap/schema-ldif-includes/*.ldif
```
Then will check following directory for more ldifs:
```
/var/openldap-data/schema-ldif-includes/*.ldif
```
You should sort file names for importing by order in each folders.

Second the system check ldif files in the following folder to import at database level 2:
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

LAPDTOOLS_DEBUG_LEVEL
----------------------
```
Level   Keyword         Description
------  --------------  -------------------------------------------------------
-1      any             enable all debugging
0                       no debugging
1       (0x1 trace)     trace function calls
2       (0x2 packets)   debug packet handling
4       (0x4 args)      heavy trace debugging
8       (0x8 conns)     connection management
16      (0x10 BER)      print out packets sent and received
32      (0x20 filter)   search filter processing
64      (0x40 config)   configuration processing
128     (0x80 ACL)      access control list processing
256     (0x100 stats)   stats log connections/operations/results
512     (0x200 stats2)  stats log entries sent
1024    (0x400 shell)   print communication with shell backends
2048    (0x800 parse)   print entry parsing debugging
16384   (0x4000 sync)   syncrepl consumer processing
32768   (0x8000 none)   only messages that get logged whatever log level is set
```
