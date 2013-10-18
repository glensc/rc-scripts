@SET_MAKE@

DEFS = @DEFS@ -D_GNU_SOURCE=1 -DSBINDIR=\""@sbindir@"\"

sysconf_DATA = \
	initlog.conf

bin_PROGRAMS = \
	doexec \
	ipcalc \
	usleep \
	run-parts \
	resolvesymlink
	
sbin_PROGRAMS =	\
	consoletype \
	genhostid \
	getkey \
	initlog \
	loglevel \
	minilogd \
	netreport \
	ppp-watch \
	start-stop-daemon \
	setuidgid \
	usernetctl
	
EXTRA_PROGRAMS = \
	testd 

EXTRA_DIST = $(sysconf_DATA)

doexec_SOURCES = doexec.c

resolvesymlink_SOURCES = resolvesymlink.c

ipcalc_SOURCES = ipcalc.c
ipcalc_LDADD = -lpopt

genhostid_SOURCES = genhostid.c

netreport_SOURCES = netreport.c

testd_SOURCES = testd.c

usernetctl_SOURCES = usernetctl.c

usleep_SOURCES = usleep.c

loglevel_SOURCES = loglevel.c

initlog_SOURCES = initlog.c initlog.h process.c process.h
initlog_LDADD = -lpopt

getkey_SOURCES = getkey.c
getkey_LDADD = -lpopt

ppp_watch_SOURCES = ppp-watch.c shvar.c shvar.h
ppp_watch_LDADD = $(GLIB_LIBS)
INCLUDES = $(GLIB_CFLAGS)

consoletype_SOURCES = consoletype.c

start_stop_daemon_SOURCES = start-stop-daemon.c
start_stop_daemon_LDADD = -lcap

setuidgid_SOURCES = setuidgid.c

run_parts_CPPFLAGS = -include config.h
