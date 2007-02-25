@SET_MAKE@

SUBDIRS = network-scripts interfaces hwprofiles cpusets

sysconfigdir = @sysconfigdir@

sysconfig_DATA = \
	clock \
	init-colors \
	hwprof \
	system \
	network \
	static-routes \
	static-nat \
	static-arp \
	i18n

noinst_DATA = \
	init-colors.gentoo

EXTRA_DIST = $(sysconfig_DATA) $(noinst_DATA)
