#
#	$Id$
#

SUBDIRS = src ppp isapnp sysconfig rc.d doc man po init

sysconf_DATA = \
	adjtime \
	inittab \
	modules \
	crypttab \
	sysctl.conf

firmwaredir = /lib/firmware

firmware_SCRIPTS = \
	firmware-loader.sh

profiledir = @sysconfdir@/profile.d

profile_DATA = \
	lang.sh	\
	lang.csh

bin_SCRIPTS = run-parts
sbin_SCRIPTS = \
	setsysfont \
	hwprofile \
	service

EXTRA_DIST = \
	$(sysconf_DATA) \
	$(profile_DATA) \
	$(firmware_SCRIPTS) \
	$(sbin_SCRIPTS) \
	$(bin_SCRIPTS)

install-data-hook:
	install -d $(DESTDIR)$(localstatedir)/cache/$(PACKAGE)
	[ -f $(DESTDIR)$(localstatedir)/cache/$(PACKAGE)/msg.cache ] || touch $(DESTDIR)$(localstatedir)/cache/$(PACKAGE)/msg.cache

# make rpms
rpm: $(PACKAGE).spec
	$(MAKE) dist
	rpmbin=`LC_ALL=C rpm -ta 2>&1 | grep -q "unknown option" && echo rpmbuild || echo rpm` ; \
		$$rpmbin -ta --clean --rmsource $(PACKAGE)-$(VERSION).tar.gz
