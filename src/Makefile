CFLAGS+=-Wall

PROGS=usernetctl doexec netreport testd usleep ipcalc

all:	$(PROGS)

clean:
	rm -f $(PROGS)

install:
	install -d $(ROOT)/bin $(ROOT)/usr/sbin $(ROOT)/usr/man/man1
	install -s doexec $(ROOT)/bin/doexec
	install -s usleep $(ROOT)/bin/usleep
	install -s usernetctl $(ROOT)/usr/sbin/usernetctl
	install -s netreport $(ROOT)/sbin/netreport
	install -s ipcalc $(ROOT)/bin/ipcalc
	install doexec.1 $(ROOT)/usr/man/man1
	install netreport.1 $(ROOT)/usr/man/man1
	install usleep.1 $(ROOT)/usr/man/man1
	install usernetctl.1 $(ROOT)/usr/man/man1
	install ipcalc.1 $(ROOT)/usr/man/man1

# this daemon and initscript are useful for testing the up/down/status stuff
# not installed by default, only comes from sources.
install-test:
	install -s testd $(ROOT)/usr/sbin/testd
	install testdinit $(ROOT)/etc/rc.d/init.d/testd

ipcalc: ipcalc.o
	$(CC) $(LDFLAGS) -o $@ $< -lpopt
