@SET_MAKE@

pppdir = @pppdir@

ppp_SCRIPTS = \
	auth-up \
	auth-down \
	ip-up \
	ip-down \
	ipx-up \
	ipx-down

EXTRA_DIST = $(ppp_SCRIPTS)	

install-data-hook: all
	ln -s ip-up	$(DESTDIR)$(pppdir)/ipv6-up
	ln -s ip-down	$(DESTDIR)$(pppdir)/ipv6-down

uninstall-hook:
	rm -f		$(DESTDIR)$(pppdir)/ipv6-up
	rm -f		$(DESTDIR)$(pppdir)/ipv6-down
