#
#	$Id: Makefile.am,v 1.4 1999/07/13 12:49:34 misiek Exp $
#

SUBDIRS = src ppp sysconfig rc.d doc

sysconf_DATA = \
	adjtime \
	inittab 

profiledir = @sysconfdir@/profile.d

profile_DATA = \
	lang.sh	\
	lang.csh
	
sbin_SCRIPTS = setsysfont

EXTRA_DIST = \
	$(sysconf_DATA) \
	$(profile_DATA) \
	$(sbin_SCRIPTS) \
	rc-scripts.spec

# make rpms
rpm: $(PACKAGE).spec
	$(MAKE) dist
	rpm -ta --clean --rmsource $(PACKAGE)-$(VERSION).tar.gz
