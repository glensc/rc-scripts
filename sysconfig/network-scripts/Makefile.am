@SET_MAKE@

libdir = @libdir@

sbin_SCRIPTS = \
	ifdown \
	ifup \
	tnldown \
	tnlup

networkscriptsdir = @networkscriptsdir@

networkscripts_SCRIPTS = \
	ifdown-br \
	ifdown-ppp \
	ifdown-post \
	ifdown-sl \
	ifup-aliases \
	ifup-br \
	ifup-ipx \
	ifup-neigh \
	ifup-plip \
	ifup-post \
	ifup-ppp \
	ifup-routes \
	ifup-sl 

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

