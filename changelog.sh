#!/bin/sh
# $Id: changelog.sh 8104 2006-12-14 17:14:21Z glen $
# Run this to generate all the initial makefiles, etc.

if [ ! -x /usr/bin/svn2log ]; then
	echo >&2 'Need svn2log program!'
	exit 1
fi

# create users for svn2log format
tmp=$(mktemp -q svn2logXXXXXX 2>/dev/null || echo ${TMPDIR:-/tmp}/svn2log.tmp)
> $tmp

[ -z "$users" -a -f ../CVSROOT/users ] && users=../CVSROOT/users
[ -z "$users" -a -f ~/.CVS-PLD/CVSROOT/users ] && users=~/.CVS-PLD/CVSROOT/users
if [ -z "$users" ]; then
	echo >&2 "Can't find users file!"
	echo >&2 'Run in parent dir to fetch one:'
	echo >&2 '$ cvs -d :pserver:cvs@cvs.pld-linux.org:/cvsroot co CVSROOT/users'
	exit 1
fi

awk -F":" ' { login=$1; if ($3 != "") { name=$3 } else { name=$1 }; email=$2; printf "%s\t%s <%s@pld-linux.org>\n", login, name, login } ' $users > $tmp

svn log -v --xml | svn2log --users-charset=ISO8859-2 --domain "pld-linux.org" -p /rc-scripts/trunk -u $tmp --exclude ChangeLog -o ChangeLog
rm -f $tmp

# obfuscate emails <user@domain> and (user@domain)
sed -i -e 's,\([<(].*\)@\(.*[)>]\),\1/at/\2,g' ChangeLog
