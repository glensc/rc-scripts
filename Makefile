ROOT=/

VERSION=$(shell awk '/define version/ { print $$3 }' rc-scripts.spec)
CVSTAG = r$(subst .,-,$(VERSION))

all:
	(cd src; make CFLAGS="$(CFLAGS)")

install:
	mkdir -p $(ROOT)/etc/profile.d $(ROOT)/sbin
	install -m644 inittab $(ROOT)/etc
	install -m644 adjtime $(ROOT)/etc
	install -m644 inputrc $(ROOT)/etc
	install -m755 setsysfont $(ROOT)/sbin
	install -m755 lang.sh $(ROOT)/etc/profile.d
	cp -af rc.d sysconfig ppp $(ROOT)/etc
	mkdir -p $(ROOT)/sbin
	mv $(ROOT)/etc/sysconfig/network-scripts/ifup $(ROOT)/sbin
	mv $(ROOT)/etc/sysconfig/network-scripts/ifdown $(ROOT)/sbin
	(cd $(ROOT)/etc/sysconfig/network-scripts; \
	  ln -sf ../../../sbin/ifup . ; \
	  ln -sf ../../../sbin/ifdown . )
	(cd src; make install ROOT=$(ROOT))
	mkdir -p $(ROOT)/var/run/netreport
	chmod og=rwx,o=rx $(ROOT)/var/run/netreport

tag-archive:
	@cvs -Q tag -F $(CVSTAG)

create-archive: tag-archive
	@rm -rf /tmp/rc-scripts
	@cd /tmp; cvs -Q -d $(CVSROOT) export -r$(CVSTAG) rc-scripts || echo GRRRrrrrr -- ignore [export aborted]
	@mv /tmp/rc-scripts /tmp/rc-scripts-$(VERSION)
	@cd /tmp; tar czSpf rc-scripts-$(VERSION).tar.gz rc-scripts-$(VERSION)
	@rm -rf /tmp/rc-scripts-$(VERSION)
	@cp /tmp/rc-scripts-$(VERSION).tar.gz .
	@rm -f /tmp/rc-scripts-$(VERSION).tar.gz 
	@echo " "
	@echo "The final archive is ./rc-scripts-$(VERSION).tar.gz."

archive: tag-archive create-archive
