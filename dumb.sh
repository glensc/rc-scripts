#!/bin/sh
# dump script used to generate .pot for translations

if /bin/false; then

nls "Zope (pid %s) is running"				"$1"
nls "alarmwatch not configured (CHIPS not set), cannot start."
nls "No kernel APM support"
nls "(backgrounded)"
nls "Setting up sound card mixer"
nls "Sound card mixer is already set up"
nls "Saving sound card mixer's settings"
nls "Sound card mixer hasn't been set up"
nls "Modular sound card detected."
nls "Monolithic sound card detected."
nls "MIDI device present."
nls "MIDI device not detected."
nls "Sound card not configured."
nls "Configured Mount Points:"
nls "Active Mount Points:"
nls "Waiting for Coda server shutdown"
nls "Setting Text Mode"
nls "Loading console font and map"
nls "Loading keyboard table"
nls "Enabling SAK sequence"
nls "Setting terminals to default values"
nls "Missing service directory"
nls "Create %s first."					"$1"
nls "no dictionaries found"
nls "Uploading em8300 microcode"
nls "Removing em8300 modules"
nls "Loading module"
nls "exim.conf: queue_only = true is missing"
nls "Please edit /etc/sysconfig/frox !"
nls "Redirecting FTP traffic"
nls "Removing FTP traffic redirection"
nls "ipchains/iptables not found. Cannot continue"
nls "Generating %s"					"$1"
nls "Setting filter rules"
nls "Flushing filter rules"
nls "%s not generated"					"$1"
nls "%s outdated"					"$1"
nls "%s not applied"					"$1"
nls "filter rules applied"
nls "Frame buffer present."
nls "Setting default video mode"
nls "Cannot start Pluto, system lacks /dev/random"
nls "Dumpdir \`%s' does not exist, ignored."		"$1"
nls "Starting FreeS/WAN IPSEC"
nls "Stopping FreeS/WAN IPSEC"
nls "Please set %s in /etc/sysconfig/mouse"		"$1"
nls "Setting parameters for drive %s"			"$1"
nls "IP protocols logger"
nls "IRCd Server"
nls "Courier IMAP - Authdaemon"
nls "DHCP Server"
nls "Gnome Display Manager"
nls "OpenH323 gatekeeper"
nls "Jabber GaduGadu transport"
nls "Jabber ICQ transport daemon"
nls "KDE Display Manager"
nls "OpenLDAP Update Replication Daemon"
nls "Linux Infrared Remote Control daemon"
nls "Linux Infrared Remote Control mouse daemon"
nls "System logger"
nls "Kernel logger"
nls "KerberosV service"
nls "%s is missing"					"$1"
nls "Starting Kerberos KDC"
nls "Starting Administration Server"
nls "Stopping Kerberos KDC"
nls "Stopping Administration Server"
nls "multicast routing daemon"
nls "Dynamic Route Daemon"
nls "%s config %s does not exist."			"$1"	"$2"
nls "MySQL datadir %s not configured properly"		"$1"
nls "MySQL user not configured properly"
nls "Edit %s and configure it."				"$1"
nls "MySQL database not initialized. Try \"%s init\" before start."	"$1"
nls "Seems that database is initialized now. Remove by hand %s"	"$1"
nls "before initializing database."
nls "Creating privilege mysql tables"
nls "Sorry, the host name is not configured."
nls "Please configure the 'hostname' command to return a hostname."
nls "Sorry, the host '%s' could not be looked up."	"$1"
nls "Please configure the 'hostname' command to return a correct hostname."
nls "Initializing %s"					"$1"
nls "pks database not initialized. Try \"%s init\" before start."	"$1"
nls "Seems that database is initialized now."
nls "Initializing database for pks"
nls "No SSH host key found! You must run \"%s init\" first."	"$1"
nls "Now the SSH host key will be generated. Please note, that if you"
nls "will use password for the key, you will need to type it on each"
nls "reboot."
nls "JAVA_HOME is not set! Edit /etc/sysconfig/tomcat"
nls "Mounting NFS filesystems"
nls "Unmounting NFS filesystems"
nls "Configured NFS mountpoints:"
nls "Active NFS mountpoints:"
nls "/proc filesystem unavailable"
nls "Registering %s"					"$1"
nls "Unregistering %s"					"$1"
nls "netsaint NSCA daemon"
nls "Stopping MARS: stopping all connections"
nls "Starting UPS drivers"
nls "Stopping UPS drivers"
nls "Reloading UPS drivers"
nls "UPS drivers and network daemon"
nls "UPS network daemon"
nls "Syncing time for ntp"
nls "Error: portmap isn't running"
nls "netsaint NRPE daemon"
nls "Name Switch Cache Daemon"
nls "No kupdate[d] found. Run bdflush-1.6 for sleep support."
nls "OpenH323 gatekeeper/proxy"
nls "omniNames for omniORB"
nls "No tunnels configured in /etc/sysconfig/openvpn"
nls "Starting OpenVPN tunnel %s"			"$1"
nls "Stopping OpenVPN tunnel %s"			"$1"
nls "Dynamic DNS daemon"
nls "Dynamic DNS Tools Server"
nls "Starting PIM-SM multicast routing daemon"
nls "Stopping PIM-SM multicast routing daemon"
nls "Parallel Virtual Machine"
nls "Killing PowerDNS without grace"
nls "PowerDNS (Powered DNS server)"
nls "PowerDNS (3 sec. timeout)"
nls "PowerDNS in foreground (testing mode)"
nls "PCIC not defined in /etc/sysconfig/pcmcia"
nls "Unloading PCMCIA modules"
nls "protolog TCP daemon"
nls "protolog UDP daemon"
nls "protolog ICMP daemon"
nls "Error: /etc/sysconfig/postgresql not found"
nls " PostgreSQL can't be run."
nls "Error: PG_DB_CLUSTERS not found or is empty"
nls "Note: this is only simple init action for convenience."
nls "If you want some non-standard options, consider using initdb(1)."
nls "Skipping existing cluster %s"			"$1"
nls "Initializing cluster %s"				"$1"
nls "REMEMBER to setup password for user \"postgres\""
nls "PPPoE Relay Server"
nls "PPPoE Server"
nls "Radius-Cistron Server"
nls "Starting Resin JSP Server"
nls "Stopping Resin JSP Server"
nls "NFS quota daemon"
nls "NFS quotas"
nls "Setting time from remote server(s): %s"		"$1"
nls "Remote time: "
nls "Local time: "
nls "Local machine hardware clock: "
nls "Syncing hardware clock"
nls " Please correct your /etc/sysconfig/rawdevices:"
nls " rawdevices are now located in the directory /dev/raw/ "
nls " If the command 'raw' still refers to /dev/raw as a file."
nls " You'll have to upgrade your util-linux package"
nls "You need to be root to use this command ! "
nls "WARNING: RADVD can work only in IPv6 networks"
nls "SAP DB WebServer"
nls "SAP DB WebServer on port %s"			"$1"
nls "Put license file in /etc/sipd/license"
nls "sensors daemon"
nls "BUS or CHIP not configured in /etc/sysconfig/sensors"
nls "SAPDB communication server"
nls "SAPDB instance %s"					"$1"
nls "Prepare sendmail db"
nls "system activity data collector"
nls "Cannot find configuration file: %s"		"$1"
nls "Waiting %s seconds..."				"$1"
nls "done."
nls "Toshiba fan daemon"
nls "X Display Manager"
nls "NIS map server"
nls "Setup /etc/sysconfig/network::NISDOMAIN before use %s."	"$1"
nls "X Font Server"
nls "NIS server"
nls "Binding to the NIS domain"
nls "Listening for a NIS domain server"
nls "Try \"%s init\" before start."			"$1"
nls "Login name [admin]: "
nls "Login password: "
nls "Password again: "
nls "ERROR: Passwords don't match"
nls ""

fi
