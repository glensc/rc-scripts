@SET_MAKE@

SUBDIRS = network-scripts interfaces

sysconfigdir = @sysconfigdir@

sysconfig_DATA = \
	clock \
	system \
	network \
	static-routes \
	static-nat \
	i18n \
	timezone

EXTRA_DIST = $(sysconfig_DATA)
