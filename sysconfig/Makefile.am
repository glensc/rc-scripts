@SET_MAKE@

SUBDIRS = network-scripts interfaces

sysconfigdir = @sysconfigdir@

sysconfig_DATA = \
	system \
	clock \
	network \
	static-routes \
	static-nat \
	i18n \
	timezone

EXTRA_DIST = $(sysconfig_DATA)
