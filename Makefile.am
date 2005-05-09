#
#	$Id$
#

SUBDIRS = src sysconfig rc.d doc man po

sysconf_DATA = \
	adjtime \
	inittab

profiledir = @sysconfdir@/profile.d

profile_DATA = \
	lang.sh	\
	lang.csh

bin_SCRIPTS = run-parts
sbin_SCRIPTS = \
	service

EXTRA_DIST = \
	$(sysconf_DATA) \
	$(profile_DATA) \
	$(sbin_SCRIPTS) \
	$(bin_SCRIPTS)

# make rpms
rpm: $(PACKAGE).spec
	$(MAKE) dist
	rpmbin=`LANG=C LC_ALL=C rpm -ta 2>&1 | grep -q "unknown option" && echo rpmbuild || echo rpm` ; \
		$$rpmbin -ta --clean --rmsource $(PACKAGE)-$(VERSION).tar.gz
