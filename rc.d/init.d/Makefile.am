@SET_MAKE@

initdir = @rcdir@/init.d

init_SCRIPTS = \
	allowlogin \
	killall \
	network \
	random \
	single \
	timezone
	
init_DATA = functions

EXTRA_DIST = $(init_SCRIPTS) $(init_DATA) functions.network template.init

install-data-hook:
	$(INSTALL) functions.network $(DESTDIR)/etc/sysconfig/network-scripts/.functions
