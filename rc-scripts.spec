Summary:	inittab and /etc/rc.d scripts
Name:		rc-scripts
Version:	0.0.1
Copyright:	GPL
Group:		Base
Group(pl):	Bazowe	
Release:	1
Source:		%{name}-%{version}.tar.gz
Buildroot:	/tmp/buildroot-%{name}-%{version}
Requires:	mingetty
Requires:	mktemp
Requires:	modutils >= 2.1.121
Prereq:		/sbin/chkconfig
Obsoletes:	initscripts
Summary(de):	inittab und /etc/rc.d Scripts
Summary(fr):	inittab et scripts /etc/rc.d
Summary(pl):	inittab i skrypty startowe z katalogu /etc/rc.d
Summary(tr):	inittab ve /etc/rc.d dosyalarý

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

install -d $RPM_BUILD_ROOT/{etc,/var/{log,run/netreport}}

make ROOT=$RPM_BUILD_ROOT install 

install -d $RPM_BUILD_ROOT/etc/rc.d/rc{0,1,2,3,4,5,6}.d

bzip2 -9 $RPM_BUILD_ROOT/usr/man/man1/*.1
bzip2 -9 sysconfig.txt
bzip2 sysconfig/network-scripts/ifcfg-*.*
bzip2 sysconfig/network-scripts/chat-*.*


%post
for i in  halt network nfsfs random reboot single  
 do /sbin/chkconfig --add $i
done 

%preun
if [ $1 = 0 ]; then
  /sbin/chkconfig --del random
  /sbin/chkconfig --del nfsfs
  /sbin/chkconfig --del network
fi

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,754)
%doc sysconfig.txt.bz2
%doc sysconfig/network-scripts/ifcfg-*.*.bz2
%doc sysconfig/network-scripts/chat-*.*.bz2

%config(noreplace) %verify(not md5 mtime size) /etc/adjtime
%config(noreplace) %verify(not md5 mtime size) /etc/inittab

%attr(640,root,root) %config(noreplace) %verify(not size mtime md5)  /etc/sysconfig/network-ip6
%attr(640,root,root) %config(noreplace) %verify(not size mtime md5)  /etc/sysconfig/network-ip6.conf

%attr(754,root,root) %dir /etc/sysconfig/network-scripts
%attr(644,root,root) %config /etc/sysconfig/network-scripts/ifcfg-lo
%attr(644,root,root) %config /etc/sysconfig/network-scripts/network-*
%attr(754,root,root) %config /etc/sysconfig/network-scripts/ifdhcpc-done
%attr(754,root,root) %config /etc/sysconfig/network-scripts/ifup
%attr(754,root,root) %config /etc/sysconfig/network-scripts/ifup-*
%attr(754,root,root) %config /etc/sysconfig/network-scripts/ifdown
%attr(754,root,root) %config /etc/sysconfig/network-scripts/ifdown-*

%attr(755,root,root) /etc/rc.d/init.d/*
%attr(755,root,root) /etc/rc.d/rc[0123456].d

%attr(750,root,root) %config /etc/rc.d/rc.sysinit
%attr(750,root,root) %config /etc/rc.d/rc.serial
%attr(750,root,root) %config /etc/rc.d/rc
%attr(700,root,root) %config(noreplace) %verify(not size mtime md5) /etc/rc.d/rc.local
%attr(755,root,root) %config /etc/profile.d/lang.sh
%attr(750,root,root) /sbin/*
%attr(755,root,root) /bin/*
%attr(755,root,root) /usr/sbin/usernetctl

%attr(750,root,root) %dir /var/run/netreport
%attr(750,root,root) %config /etc/ppp/*

%attr(644,root, man) /usr/man/man1/*

%changelog
* Fri Mar 19 1999 PLD Team <bugs@pld.org.pl>
  [0.0.1]
- Full changelog in PLD's CVS.
- First Release.
- Package based on RedHat's initscripts-3.78.
