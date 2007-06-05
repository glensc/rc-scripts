@SET_MAKE@

sbin_SCRIPTS = \
	ifdown \
	ifup \
	tnldown \
	tnlup \
	bonddown \
	bondup

networkscriptsdir = @networkscriptsdir@

networkscripts_SCRIPTS = \
	ifdown-br \
	ifdown-irda \
	ifdown-ppp \
	ifdown-post \
	ifdown-sl \
	ifdown-vlan \
	ifup-aliases \
	ifup-br \
	ifup-ipx \
	ifup-irda \
	ifup-iucv \
	ifup-neigh \
	ifup-plip \
	ifup-plusb \
	ifup-post \
	ifup-ppp \
	ifup-routes \
	ifup-sl \
	ifup-vlan

networkscripts_DATA = \
        functions.network
	
#SUBDIRS = data

interfacesdir = @sysconfigdir@/interfaces

interfaces_DATA = 

EXTRA_DIST = \
	$(interfaces_DATA) \
	$(sbin_SCRIPTS) \
	$(networkscripts_SCRIPTS) \
	$(networkscripts_DATA)

