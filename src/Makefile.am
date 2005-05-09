@SET_MAKE@

GLIBDIR = @GLIBDIR@
GCFLAGS = @GCFLAGS@
GLIBNAME = @GLIBNAME@

DEFS = @DEFS@ -D_GNU_SOURCE=1 -DSBINDIR=\""@sbindir@"\"

sysconf_DATA = \
	initlog.conf

bin_PROGRAMS = \
	doexec \
	ipcalc \
	usleep \
	resolvesymlink
	
sbin_PROGRAMS =	\
	consoletype \
	genhostid \
	getkey \
	initlog \
	loglevel \
	minilogd \
	netreport \
	start-stop-daemon
	
EXTRA_PROGRAMS = \
	testd 

EXTRA_DIST = $(sysconf_DATA)

doexec_SOURCES = doexec.c

resolvesymlink_SOURCE = resolvesymlink.c

ipcalc_SOURCES = ipcalc.c
ipcalc_LDADD = -lpopt

genhostid_SOURCES = genhostid.c

netreport_SOURCES = netreport.c

testd_SOURCES = testd.c

usleep_SOURCES = usleep.c
usleep_LDADD = -lpopt

loglevel_SOURCES = loglevel.c

initlog_SOURCES = initlog.c initlog.h process.c process.h
initlog_LDADD = -lpopt

getkey_SOURCES = getkey.c
getkey_LDADD = -lpopt

consoletype_SOURCES = consoletype.c

start_stop_daemon_SOURCES = start-stop-daemon.c

