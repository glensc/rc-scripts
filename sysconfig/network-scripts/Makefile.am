@SET_MAKE@

libdir = @libdir@

sbin_SCRIPTS = \
	ifdown \
	ifup \
	tnldown \
	tnlup

networkscriptsdir = @networkscriptsdir@

networkscripts_SCRIPTS = \
	functions.network \
	ifdown-atm \
	ifdown-br \
	ifdown-irda \
	ifdown-lec \
	ifdown-post \
	ifdown-ppp \
	ifdown-sl \
	ifdown-vlan \
	ifup-aliases \
	ifup-atm \
	ifup-br \
	ifup-ipx \
	ifup-irda \
	ifup-iucv \
	ifup-lec \
	ifup-plip \
	ifup-plusb \
	ifup-post \
	ifup-ppp \
	ifup-routes \
	ifup-sl \
	ifup-vlan

#SUBDIRS = data

interfacesdir = @sysconfigdir@/interfaces

interfaces_DATA = 

EXTRA_DIST = \
	$(interfaces_DATA) \
	$(sbin_SCRIPTS) \
	$(networkscripts_SCRIPTS)
