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
	static-arp \
	i18n \
	timezone \
	ip-rules

EXTRA_DIST = $(sysconfig_DATA)
