#
#	$Id: Makefile.am,v 1.5 1999/08/07 10:16:13 wiget Exp $
#

SUBDIRS = src ppp sysconfig rc.d doc po

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
