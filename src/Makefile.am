@SET_MAKE@

DEFS = @DEFS@ -D_GNU_SOURCE=1

sysconf_DATA = \
	initlog.conf

bin_PROGRAMS = \
	doexec \
	ipcalc \
	usleep \
	resolvesymlink
	
sbin_PROGRAMS =	\
	netreport \
	usernetctl \
	initlog \
	loglevel \
	getkey \
	ppp-watch \
	consoletype
	
EXTRA_PROGRAMS = \
	testd 

EXTRA_DIST = $(sysconf_DATA)

doexec_SOURCES = doexec.c

resolvesymlink_SOURCE = resolvesymlink.c

ipcalc_SOURCES = ipcalc.c
ipcalc_LDADD = -lpopt

netreport_SOURCES = netreport.c

testd_SOURCES = testd.c

usernetctl_SOURCES = usernetctl.c

usleep_SOURCES = usleep.c
usleep_LDADD = -lpopt

loglevel_SOURCES = loglevel.c

initlog_SOURCES = initlog.c initlog.h process.c process.h
initlog_LDADD = -lpopt

getkey_SOURCES = getkey.c

ppp_watch_SOURCES = ppp-watch.c shvar.c shvar.h
ppp_watch_LDADD = /usr/lib/libglib.a
INCLUDES = `glib-config --cflags`

consoletype_SOURCES = consoletype.c
