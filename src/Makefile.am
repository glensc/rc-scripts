@SET_MAKE@

bin_PROGRAMS = \
	doexec \
	ipcalc \
	usleep

sbin_PROGRAMS =	\
	netreport \
	usernetctl 
	
EXTRA_PROGRAMS = \
	testd 
	
doexec_SOURCES = doexec.c
ipcalc_SOURCES = ipcalc.c
ipcalc_LDADD = -lpopt
netreport_SOURCES = netreport.c
testd_SOURCES = testd.c
usernetctl_SOURCES = usernetctl.c
usleep_SOURCES = usleep.c
