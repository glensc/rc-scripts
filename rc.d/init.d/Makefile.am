@SET_MAKE@

initdir = @rcdir@/init.d

init_SCRIPTS = \
	allowlogin \
	killall \
	network \
	random \
	single \
	allowlogin
	
init_DATA = functions

EXTRA_DIST = $(init_SCRIPTS) $(init_DATA) functions.network

install-data-hook:
	$(INSTALL) functions.network $(DESTDIR)/etc/sysconfig/network-scrpts/.functions
