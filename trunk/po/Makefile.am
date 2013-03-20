@SET_MAKE@


EXTRA_DIST = @POTFILES@ @PACKAGE@.pot makepot.pl

POTSRC = @POTSRC@

makepot = $(top_srcdir)/po/makepot.pl

CATOBJEXT = .gmo
INSTOBJEXT = .mo

SUFFIXES = .po .mo .gmo

.po.mo: $(PACKAGE).pot
	$(MSGFMT) -c --statistics -o $@ $<

.po.gmo: $(PACKAGE).pot
	file=`echo $* | awk ' { gsub(/.*\//,NIL); print $0; } '`.gmo \
	  && rm -f $$file && $(GMSGFMT) -c --statistics -o $$file $<

$(PACKAGE).pot: Makefile $(POTSRC)
	LC_ALL=C $(makepot) $(POTSRC) > $(PACKAGE).po
	cmp $(PACKAGE).po $(PACKAGE).pot || \
		mv $(PACKAGE).po $(PACKAGE).pot; \
	rm -f $(PACKAGE).po

update-po: Makefile
	$(MAKE) $(PACKAGE).pot
	PATH=`pwd`/../src:$$PATH; \
	cd $(srcdir); \
	catalogs='$(CATALOGS)'; \
	for cat in $$catalogs; do \
	  cat=`basename $$cat`; \
	  lang=`echo $$cat | awk ' { gsub(/\$(CATOBJEXT)$$/,NIL); print $0; } '`; \
	  mv $$lang.po $$lang.old.po; \
	  echo "$$lang:"; \
	  if $(MSGMERGE) $$lang.old.po $(PACKAGE).pot -o $$lang.po; then \
	    rm -f $$lang.old.po; \
	  else \
	    echo "msgmerge for $$cat failed!"; \
	    rm -f $$lang.po; \
	    mv $$lang.old.po $$lang.po; \
	  fi; \
	done

all-am: Makefile $(CATALOGS)

install-data-hook: all
	if test -r "$(MKINSTALLDIRS)"; then \
	  $(MKINSTALLDIRS) $(DESTDIR)$(datadir); \
	else \
	  $(mkinstalldirs) $(DESTDIR)$(datadir); \
	fi
	@catalogs='$(CATALOGS)'; \
	for cat in $$catalogs; do \
	  cat=`basename $$cat`; \
	  case "$$cat" in \
	    *.gmo) destdir=$(gnulocaledir);; \
	    *)     destdir=$(localedir);; \
	  esac; \
	  lang=`echo $$cat | awk ' { gsub(/\$(CATOBJEXT)$$/,NIL); print $0; } '`; \
	  dir=$(DESTDIR)$$destdir/$$lang/LC_MESSAGES; \
	  if test -r "$(MKINSTALLDIRS)"; then \
	    $(MKINSTALLDIRS) $$dir; \
	  else \
	    $(mkinstalldirs) $$dir; \
	  fi; \
	  if test -r $$cat; then \
	    $(INSTALL_DATA) $$cat $$dir/$(PACKAGE)$(INSTOBJEXT); \
	    echo "installing $$cat as $$dir/$(PACKAGE)$(INSTOBJEXT)"; \
	  else \
	    $(INSTALL_DATA) $(srcdir)/$$cat $$dir/$(PACKAGE)$(INSTOBJEXT); \
	    echo "installing $(srcdir)/$$cat as" \
		 "$$dir/$(PACKAGE)$(INSTOBJEXT)"; \
	  fi; \
	  if test -r $$cat.m; then \
	    $(INSTALL_DATA) $$cat.m $$dir/$(PACKAGE)$(INSTOBJEXT).m; \
	    echo "installing $$cat.m as $$dir/$(PACKAGE)$(INSTOBJEXT).m"; \
	  else \
	    if test -r $(srcdir)/$$cat.m ; then \
	      $(INSTALL_DATA) $(srcdir)/$$cat.m \
		$$dir/$(PACKAGE)$(INSTOBJEXT).m; \
	      echo "installing $(srcdir)/$$cat as" \
		   "$$dir/$(PACKAGE)$(INSTOBJEXT).m"; \
	    else \
	      true; \
	    fi; \
	  fi; \
	done

# Define this as empty until I found a useful application.
installcheck:

uninstall-hook:
	catalogs='$(CATALOGS)'; \
	for cat in $$catalogs; do \
	  cat=`basename $$cat`; \
	  lang=`echo $$cat | awk ' { gsub(/\$(CATOBJEXT)$$/,NIL); print $0; } '`; \
	  rm -f $(DESTDIR)$(localedir)/$$lang/LC_MESSAGES/$(PACKAGE)$(INSTOBJEXT); \
	  rm -f $(DESTDIR)$(localedir)/$$lang/LC_MESSAGES/$(PACKAGE)$(INSTOBJEXT).m; \
	  rm -f $(DESTDIR)$(gnulocaledir)/$$lang/LC_MESSAGES/$(PACKAGE)$(INSTOBJEXT); \
	  rm -f $(DESTDIR)$(gnulocaledir)/$$lang/LC_MESSAGES/$(PACKAGE)$(INSTOBJEXT).m; \
	done

clean-generic:
	rm -f *.gmo *.mo $(PACKAGE).pot
