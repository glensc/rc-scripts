@SET_MAKE@

SUBDIRS = data up.d down.d

interfacesdir = @sysconfigdir@/interfaces

interfaces_DATA = ifcfg-eth0

noinst_DATA = \
	ifcfg-br0 \
	ifcfg-description \
	ifcfg-eth0.1 \
	ifcfg-irda0 \
	ifcfg-irlan0 \
	ifcfg-ppp0.callback \
	ifcfg-ppp0.eagle-usb-neostrada \
	ifcfg-ppp0.gprs-plusgsm \
	ifcfg-ppp0.leased1 \
	ifcfg-ppp0.leased2 \
	ifcfg-ppp0.speedtouch-neostrada \
	ifcfg-ppp0.tpsa \
	ifcfg-ppp0.ueagle-neostrada \
	ifcfg-sl0 \
	tnlcfg-description \
	tnlcfg-icm 


EXTRA_DIST = $(interfaces_DATA) $(noinst_DATA)
