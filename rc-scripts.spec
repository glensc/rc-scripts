Summary:	inittab and /etc/rc.d scripts
Summary(de):	inittab und /etc/rc.d Scripts
Summary(fr):	inittab et scripts /etc/rc.d
Summary(pl):	inittab i skrypty startowe z katalogu /etc/rc.d
Summary(tr):	inittab ve /etc/rc.d dosyalarý
Name:		rc-scripts
Version:	0.0.3
Copyright:	GPL
Group:		Base
Group(pl):	Bazowe	
Release:	1
Source:		%{name}-%{version}.tar.gz
Buildroot:	/tmp/buildroot-%{name}-%{version}
Requires:	mingetty
Requires:	mktemp
Requires:	modutils >= 2.1.121
Provides:	initscripts
Prereq:		/sbin/chkconfig
Obsoletes:	initscripts

%description
This package contains the scripts use to boot a system, change run
levels, and shut the system down cleanly. It also contains the scripts
that activate and deactivate most network interfaces.

%description -l de
Dieses Paket enthält die Scripts, die zum Hochfahren des Systems, Ändern
der Betriebsebene und sauberem Herunterfahren des Systems erforderlich sind.
Außerdem enthält es die Scripts, die Netzwerkschnittstellen aktivieren und
deaktivieren.

%description -l fr
Ce package contient les scripts utilisés pour démarrer le systéme,
changer les niveaux d'exécution, et arréter le systéme proprement.
Il contient aussi les scripts qui activent et désactivent la plupart
des inetrfaces réseau.

%description -l pl
Pakiet zawiera skrypty uruchamiane przy starcie i zamykaniu systemu, a
tak¿e przy zmianie poziomu uruchomienia. 

%description -l tr
Bu paket, sistem açmak, çalýþma düzeylerini deðiþtirmek ve sistemi düzgün bir
þekilde kapatmak için gereken dosyalarý içerir. Ayrýca pek çok bilgisayar aðý
arayüzlerini etkinleþtiren ya da edilginleþtiren programcýklar içerir.

%prep
%setup -q

%build
CFLAGS="$RPM_OPT_FLAGS -w" make

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT/etc/rc.d/init.d

make ROOT=$RPM_BUILD_ROOT install 

gzip -9nf $RPM_BUILD_ROOT/usr/man/man*/* \
	sysconfig.txt

%post
for i in  halt network nfsfs random reboot single  
	do /sbin/chkconfig --add $i
done 
if [ -f /etc/inittab.rpmsave ]; then
	echo "**** Found old /etc/inittab.rpmsave ****"
	echo "/etc/inittab renamed to /etc/inittab.rpmnew"
	mv /etc/inittab /etc/inittab.rpmnew
	echo "/etc/inittab.rpmsave renamed to /etc/inittab."
	mv /etc/inittab.rpmsave /etc/inittab
fi

%preun
if [ "$1" = "0" ]; then
	/sbin/chkconfig --del random
	/sbin/chkconfig --del nfsfs
	/sbin/chkconfig --del network
fi

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,754)
%doc sysconfig.txt.gz
%doc sysconfig/network-scripts/ifcfg-ppp*
%doc sysconfig/network-scripts/chat-ppp*

%config(noreplace) %verify(not md5 mtime size) /etc/adjtime
%config(noreplace) %verify(not md5 mtime size) /etc/inittab

%attr(640,root,root) %config(noreplace) %verify(not size mtime md5) /etc/sysconfig/network-ip6
%attr(640,root,root) %config(noreplace) %verify(not size mtime md5) /etc/sysconfig/network-ip6.conf
%attr(640,root,root) %config(noreplace) %verify(not size mtime md5) /etc/sysconfig/system

%attr(755,root,root) %dir /etc/sysconfig/network-scripts
%attr(644,root,root) /etc/sysconfig/network-scripts/ifcfg-lo
%attr(644,root,root) /etc/sysconfig/network-scripts/network-*
%attr(754,root,root) /etc/sysconfig/network-scripts/ifdhcpc-done
%attr(754,root,root) /etc/sysconfig/network-scripts/ifup
%attr(754,root,root) /etc/sysconfig/network-scripts/ifup-*
%attr(754,root,root) /etc/sysconfig/network-scripts/ifdown
%attr(754,root,root) /etc/sysconfig/network-scripts/ifdown-*

%attr(754,root,root) /etc/rc.d/init.d/*

%attr(754,root,root) /etc/rc.d/rc.sysinit
%attr(754,root,root) /etc/rc.d/rc.serial
%attr(754,root,root) /etc/rc.d/rc
%attr(754,root,root) /etc/rc.d/rc.local
%attr(755,root,root) /etc/profile.d/lang.sh
%attr(754,root,root) /sbin/*
%attr(755,root,root) /bin/*
%attr(755,root,root) /usr/sbin/usernetctl

%attr(750,root,root) %dir /var/run/netreport
%attr(755,root,root,755) /etc/ppp

/usr/man/man1/*

%changelog
* Tue Mar 23 1999 Tomasz K³oczko <kloczek@rudy.mif.pg.gda.pl>
  [0.0.2-1]
- be more verbose while upgrading when /etc/inittab.rpmsave is found,
- added seting NETWORK="no" variable to when /etc/sysconfig/network is not present
  or when NETWORK in this file is not defined.

* Sun Mar 21 1999 Tomasz K³oczko <kloczek@rudy.mif.pg.gda.pl>
  [0.0.1-1]
- added /etc/sysconfig/system,
- removed man group from man pages,
- added in %post not replacing /etc/inittab on upgrade from initscripts,
- removed %config from scripts.

* Fri Mar 19 1999 PLD Team <bugs@pld.org.pl>
- Full changelog in PLD's CVS.
- First Release.
- Package based on RedHat's initscripts-3.78.