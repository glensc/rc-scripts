@SET_MAKE@

SUBDIRS = network-scripts interfaces

sysconfigdir = @sysconfigdir@

sysconfig_DATA = \
	system \
	network \
	static-routes \
	static-nat
	ipchains

EXTRA_DIST = $(sysconfig_DATA)
