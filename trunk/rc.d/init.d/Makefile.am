@SET_MAKE@

initdir = @rcdir@/init.d

init_SCRIPTS = \
	allowlogin \
	cpusets \
	killall \
	netfs \
	network \
	random \
	single \
	sys-chroots \
	cryptsetup \
	local

EXTRA_DIST = $(init_SCRIPTS) $(init_DATA)

install-data-hook: all
	$(LN_S) $(initdir) $(DESTDIR)$(sysconfdir)/init.d
	$(LN_S) /lib/rc-scripts/functions $(DESTDIR)$(initdir)/functions

uninstall-hook:
	rm -f $(DESTDIR)$(sysconfdir)/init.d
	rm -f $(DESTDIR)$(sysconfdir)/init.d/functions
