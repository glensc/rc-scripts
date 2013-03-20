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
	ln -sf ip-up	$(DESTDIR)$(pppdir)/ipv6-up
	ln -sf ip-down	$(DESTDIR)$(pppdir)/ipv6-down

uninstall-hook:
	rm -f		$(DESTDIR)$(pppdir)/ipv6-up
	rm -f		$(DESTDIR)$(pppdir)/ipv6-down
