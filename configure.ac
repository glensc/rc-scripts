dnl $Id$

AC_INIT(["rc-scripts"], [0.4.0.16], [pld-rc-scripts@pld-linux.org], [rc-scripts])
AM_INIT_AUTOMAKE

ALL_LINGUAS="pl de"

echo -n "Finding shell scripts"
SHSCRIPTS=""
for shfile in $(find ${srcdir}/rc.d ${srcdir}/sysconfig ! -path "*/\.*/*" ! -name "*~" -type f); do
    echo -n "."
    if (LANG=C file ${shfile} | grep -q 'shell script'); then
	SHSCRIPTS="${SHSCRIPTS} ${shfile}"
    fi
done
echo "done"

dnl Checks for programs.
AC_PROG_CC
AC_ISC_POSIX
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET

pppdir='${sysconfdir}/ppp'
sysconfigdir='${sysconfdir}/sysconfig'
updir='${sysconfigdir}/interfaces/up.d'
downdir='${sysconfigdir}/interfaces/down.d'
networkscriptsdir='${sysconfigdir}/network-scripts'
rcdir='${sysconfdir}/rc.d'
docdir="${prefix}/doc/$PACKAGE-$VERSION"

dnl i18n support
AC_PATH_PROGS(MSGMERGE, msgmerge)
AC_PATH_PROGS(GMSGFMT, gmsgfmt msgfmt)

CATALOGS=
POTFILES=
for lang in $ALL_LINGUAS; do
        CATALOGS="$CATALOGS $lang.gmo"
        POTFILES="$POTFILES $lang.po"
done

POTSRC=
for src in $SHSCRIPTS; do
        POTSRC="$POTSRC \$(top_srcdir)/$src"
done
AC_ARG_WITH(localedir,
        [  --with-localedir=PATH      specify where the locale stuff should go ])

if test "x$LOCALEDIR" = "x"; then
        if test "x$with_localedir" != "x"; then
                LOCALEDIR=$with_localedir
        else
                LOCALEDIR='$(prefix)/share/locale'
        fi
fi

localedir=$LOCALEDIR
gnulocaledir=$LOCALEDIR

if test "`eval echo $sysconfdir`" = "NONE/etc"; then
        defaultdir="/usr/local/etc"
else
        defaultdir="`eval echo $sysconfdir`"
fi

AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
GLIBDIR=none
AC_MSG_CHECKING([glib2 dir])
GLIBDIR="`$PKG_CONFIG --variable=libdir glib-2.0`"
GLIBNAME="libglib-2.0.a"
GCFLAGS="`$PKG_CONFIG --cflags-only-I glib-2.0`"
if test "x$GLIBDIR" = "x"; then
    AC_MSG_RESULT([none])
    AC_MSG_CHECKING([glib dir])
    GLIBDIR="`$PKG_CONFIG --variable=libdir glib`"
    GLIBNAME="libglib.a"
    GCFLAGS="`$PKG_CONFIG --cflags-only-I glib`"
fi
if test "x$GLIBDIR" = "x"; then
    GLIBDIR=/usr/lib
fi
AC_MSG_RESULT([$GLIBDIR])

dnl Output
AC_SUBST(BASHSCRIPTS)
AC_SUBST(CATALOGS)
AC_SUBST(POTFILES)
AC_SUBST(POTSRC)
AC_SUBST(localedir)
AC_SUBST(gnulocaledir)
			
AC_SUBST(pppdir)
AC_SUBST(networkscriptsdir)
AC_SUBST(sysconfigdir)
AC_SUBST(updir)
AC_SUBST(downdir)
AC_SUBST(rcdir)
AC_SUBST(docdir)
AC_SUBST(GLIBDIR)
AC_SUBST(GLIBNAME)
AC_SUBST(GCFLAGS)

AC_CONFIG_FILES([Makefile src/Makefile doc/Makefile \
	ppp/Makefile \
	isapnp/Makefile \
	sysconfig/Makefile \
	sysconfig/hwprofiles/Makefile \
	sysconfig/network-scripts/Makefile \
	sysconfig/interfaces/Makefile \
	sysconfig/interfaces/data/Makefile \
	sysconfig/interfaces/up.d/Makefile \
	sysconfig/interfaces/up.d/all/Makefile \
	sysconfig/interfaces/up.d/ip/Makefile \
	sysconfig/interfaces/up.d/ipx/Makefile \
	sysconfig/interfaces/up.d/ppp/Makefile \
	sysconfig/interfaces/up.d/tnl/Makefile \
	sysconfig/interfaces/down.d/Makefile \
	sysconfig/interfaces/down.d/all/Makefile \
	sysconfig/interfaces/down.d/ip/Makefile \
	sysconfig/interfaces/down.d/ipx/Makefile \
	sysconfig/interfaces/down.d/ppp/Makefile \
	sysconfig/interfaces/down.d/tnl/Makefile \
	rc.d/Makefile rc.d/init.d/Makefile \
	po/Makefile \
	rc-scripts.spec])
AC_OUTPUT
