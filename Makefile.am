
SUBDIRS = src doc ppp sysconfig rc.d

sysconf_DATA = \
	adjtime \
	inittab \
	inputrc

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
