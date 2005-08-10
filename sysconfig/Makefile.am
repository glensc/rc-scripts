@SET_MAKE@

SUBDIRS = network-scripts interfaces hwprofiles cpusets

sysconfigdir = @sysconfigdir@

sysconfig_DATA = \
	clock \
	init-colors \
	init-colors.gentoo \
	hwprof \
	system \
	network \
	static-routes \
	static-nat \
	static-arp \
	i18n \
	timezone

EXTRA_DIST = $(sysconfig_DATA)
