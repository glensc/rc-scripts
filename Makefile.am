#
#	$Id$
#

SUBDIRS = src ppp isapnp sysconfig rc.d doc po

sysconf_DATA = \
	adjtime \
	inittab \
	modules \
	sysctl.conf

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
	$(sbin_SCRIPTS) \
	$(bin_SCRIPTS) \
	rc-scripts.spec

# make rpms
rpm: $(PACKAGE).spec
	$(MAKE) dist
	rpm -ta --clean --rmsource $(PACKAGE)-$(VERSION).tar.gz
