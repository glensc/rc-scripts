ROOT=/

VERSION=$(shell awk '/define version/ { print $$3 }' initscripts.spec)
CVSTAG = r$(subst .,-,$(VERSION))

all:
	(cd src; make CFLAGS="$(CFLAGS)")

install:
	install -d $(ROOT)/etc/profile.d $(ROOT)/sbin
	install inittab $(ROOT)/etc
	install adjtime $(ROOT)/etc
	install setsysfont $(ROOT)/sbin
	install lang.sh $(ROOT)/etc/profile.d
	cp -af rc.d sysconfig ppp $(ROOT)/etc
	install -d $(ROOT)/sbin
	mv $(ROOT)/etc/sysconfig/network-scripts/ifup $(ROOT)/sbin
	mv $(ROOT)/etc/sysconfig/network-scripts/ifdown $(ROOT)/sbin
	(cd $(ROOT)/etc/sysconfig/network-scripts; \
	  ln -sf ../../../sbin/ifup . ; \
	  ln -sf ../../../sbin/ifdown . )
	(cd src; make install ROOT=$(ROOT))
	install -d $(ROOT)/var/run/netreport

tag-archive:
	@cvs tag -F $(CVSTAG)

create-archive: tag-archive
	@rm -rf /tmp/initscripts
	@cd /tmp; cvs export -r$(CVSTAG) initscripts
	@mv /tmp/initscripts /tmp/initscripts-$(VERSION)
	@cd /tmp; tar czSpf initscripts-$(VERSION).tar.gz initscripts-$(VERSION)
	@rm -rf /tmp/initscripts-$(VERSION)
	@cp /tmp/initscripts-$(VERSION).tar.gz .
	@rm -f /tmp/initscripts-$(VERSION).tar.gz 
	@echo " "
	@echo "The final archive is ./initscripts-$(VERSION).tar.gz."

archive: tag-archive create-archive
