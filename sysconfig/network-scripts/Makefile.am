@SET_MAKE@

libdir = @libdir@

sbin_SCRIPTS = \
	ifdhcpc-done \
	ifdown \
	ifdown-ppp \
	ifdown-sl \
	ifup \
	ifup-aliases \
	ifup-ipx \
	ifup-plip \
	ifup-post \
	ifup-ppp \
	ifup-routes \
	ifup-sl 

#	ifdown-tunnel \
#	ifup-tunnel \
#	ifdown-post 

lib_DATA = network-functions


#SUBDIRS = data

interfacesdir = @sysconfigdir@/interfaces

interfaces_DATA = 

EXTRA_DIST = \
	$(interfaces_DATA) \
	$(sbin_SCRIPTS) \
