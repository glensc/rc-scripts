dnl $Id$

AC_INIT(["rc-scripts"], [0.4.3.3], [pld-rc-scripts@lists.pld-linux.org], [rc-scripts])
AM_INIT_AUTOMAKE

ALL_LINGUAS="pl de"

echo -n "Finding shell scripts"
SHSCRIPTS=""
for shfile in $(find ${srcdir}/rc.d ${srcdir}/sysconfig ! -path "*/\.*/*" ! -name "*~" -type f); do
    echo -n "."
    if (LC_ALL=C file ${shfile} | grep -q 'shell script'); then
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
initdir='${sysconfdir}/init'
firmwaredir='${exec_prefix}/lib'
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

DPKG_C_GCC_ATTRIBUTE([,,],supported,[int x],[,,],ATTRIB,[Define if function attributes a la GCC 2.5 and higher are available.],
  DPKG_C_GCC_ATTRIBUTE(noreturn,noreturn,[int x],noreturn,NORETURN,[Define if nonreturning functions a la GCC 2.5 and higher are available.])
  DPKG_C_GCC_ATTRIBUTE(const,const,[int x],const,CONST,[Define if constant functions a la GCC 2.5 and higher are available.])
  DPKG_C_GCC_ATTRIBUTE(unused,unused,[int x],unused,UNUSED,[Define if unused variables la GCC 2.5 and higher are available.])
  DPKG_C_GCC_ATTRIBUTE(format...,format,[char *y, ...],[format(printf,1,2)],PRINTFFORMAT,[Define if printf-format argument lists a la GCC are available.]))

AC_CHECK_TYPE(ptrdiff_t,int)
AC_CHECK_HEADERS([stddef.h sys/capability.h])

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
AC_SUBST(initdir)
AC_SUBST(docdir)
AC_SUBST(firmwaredir)
AC_SUBST(GLIBDIR)
AC_SUBST(GLIBNAME)
AC_SUBST(GCFLAGS)

AH_BOTTOM([
#ifdef HAVE_STDDEF_H
#include <stddef.h>
#endif

/* Use the definitions: */

/* The maximum length of a #! interpreter displayed by dpkg-deb. */
#ifdef PATH_MAX
#define INTERPRETER_MAX PATH_MAX
#else
#define INTERPRETER_MAX 1024
#endif

/* GNU C attributes. */
#ifndef FUNCATTR
#ifdef HAVE_GNUC25_ATTRIB
#define FUNCATTR(x) __attribute__(x)
#else
#define FUNCATTR(x)
#endif
#endif

/* GNU C printf formats, or null. */
#ifndef ATTRPRINTF
#ifdef HAVE_GNUC25_PRINTFFORMAT
#define ATTRPRINTF(si,tc) format(printf,si,tc)
#else
#define ATTRPRINTF(si,tc)
#endif
#endif
#ifndef PRINTFFORMAT
#define PRINTFFORMAT(si,tc) FUNCATTR((ATTRPRINTF(si,tc)))
#endif

/* GNU C nonreturning functions, or null. */
#ifndef ATTRNORETURN
#ifdef HAVE_GNUC25_NORETURN
#define ATTRNORETURN noreturn
#else /* ! HAVE_GNUC25_NORETURN */
#define ATTRNORETURN
#endif /* HAVE_GNUC25_NORETURN */
#endif /* ATTRNORETURN */

#ifndef NONRETURNING
#define NONRETURNING FUNCATTR((ATTRNORETURN))
#endif /* NONRETURNING */

/* Combination of both the above. */
#ifndef NONRETURNPRINTFFORMAT
#define NONRETURNPRINTFFORMAT(si,tc) FUNCATTR((ATTRPRINTF(si,tc),ATTRNORETURN))
#endif

/* GNU C constant functions, or null. */
#ifndef ATTRCONST
#ifdef HAVE_GNUC25_CONST
#define ATTRCONST const
#else
#define ATTRCONST
#endif
#endif
#ifndef CONSTANT
#define CONSTANT FUNCATTR((ATTRCONST))
#endif

/* GNU C unused functions, or null. */
#ifndef ATTRUNUSED
#ifdef HAVE_GNUC25_UNUSED
#define ATTRUNUSED
#else
#define ATTRUNUSED
#endif
#endif
#ifndef UNUSED
#define UNUSED FUNCATTR((ATTRUNUSED))
#endif
])

AM_CONFIG_HEADER(src/config.h)
AC_CONFIG_FILES([Makefile \
	src/Makefile \
	doc/Makefile \
	man/Makefile \
	man/de/Makefile \
	man/es/Makefile \
	man/fr/Makefile \
	man/ja/Makefile \
	man/ru/Makefile \
	man/sv/Makefile \
	ppp/Makefile \
	isapnp/Makefile \
	sysconfig/Makefile \
	sysconfig/cpusets/Makefile \
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
	init/Makefile \
	])
AC_OUTPUT
