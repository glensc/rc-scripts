@SET_MAKE@

SUBDIRS = network-scripts interfaces hwprofiles

sysconfigdir = @sysconfigdir@

sysconfig_DATA = \
	clock \
	hwprof \
	system \
	network \
	static-routes \
	static-nat \
	i18n \
	timezone

EXTRA_DIST = $(sysconfig_DATA)
