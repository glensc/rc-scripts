@SET_MAKE@

SUBDIRS = network-scripts interfaces hwprofiles

sysconfigdir = @sysconfigdir@

sysconfig_DATA = \
	clock \
	init-colors \
	init-colors.plddefault \
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
