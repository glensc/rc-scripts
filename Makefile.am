#
#	$Id: Makefile.am,v 1.6 2000/05/07 18:59:59 siefca Exp $
#

SUBDIRS = src ppp sysconfig rc.d doc po

sysconf_DATA = \
	adjtime \
	inittab 

profiledir = @sysconfdir@/profile.d

profile_DATA = \
	lang.sh	\
	lang.csh
	
bin_SCRIPTS = run-parts
sbin_SCRIPTS = setsysfont

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
