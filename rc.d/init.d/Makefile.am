@SET_MAKE@

initdir = @rcdir@/init.d

init_SCRIPTS = \
	allowlogin \
	killall \
	network \
	single \
	timezone
	
init_DATA = functions

EXTRA_DIST = $(init_SCRIPTS) $(init_DATA) template.init

install-data-hook: all
	$(LN_S) $(initdir) $(DESTDIR)$(sysconfdir)/init.d

uninstall-hook:
	rm -f $(DESTDIR)$(sysconfdir)/init.d

