@SET_MAKE@

sbin_SCRIPTS = \
	ifdown \
	ifup \
	tnldown \
	tnlup

#scriptsdir = @networkscriptsdir@
scriptsdir = @exec_prefix@/lib/$(PACKAGE)

scripts_SCRIPTS = \
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

scripts_DATA = \
	functions \
	functions.network

EXTRA_DIST = \
	$(sbin_SCRIPTS) \
	$(scripts_SCRIPTS) \
	$(scripts_DATA)

