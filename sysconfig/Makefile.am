@SET_MAKE@

SUBDIRS = interfaces hwprofiles cpusets

sysconfigdir = @sysconfigdir@

sysconfig_DATA = \
	init-colors \
	hwprof \
	system \
	network \
	static-routes \
	static-routes6 \
	static-nat \
	static-arp \
	i18n

noinst_DATA = \
	init-colors.gentoo

EXTRA_DIST = $(sysconfig_DATA) $(noinst_DATA)
