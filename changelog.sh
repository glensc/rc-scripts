#!/bin/sh
# $Id$
# Run this to generate ChangeLog.

if [ ! -x /usr/bin/svn2log ]; then
	echo >&2 'Need svn2log program!'
	exit 1
fi

# make sure '.' entry is up to date, or the log will be outdated too
svn up . >/dev/null

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

# be sure users file is up to date
(
	cd $(dirname "$users")
	cvs up users
)

awk -F":" ' { login=$1; if ($3 != "") { name=$3 } else { name=$1 }; email=$2; printf "%s\t%s <%s@pld-linux.org>\n", login, name, login } ' $users > $tmp

branch=$(svn info | awk '/URL:/{print $NF}' | sed -e 's,^.*svn.pld-linux.org/svn,,')

if grep -q vim:encoding=utf-8 $users; then
	charset=UTF-8
else
	charset=ISO8859-2
fi
LC_ALL=C svn log -v --xml | LC_ALL=C svn2log --users-charset=$charset --domain "pld-linux.org" -p $branch -u $tmp --exclude ChangeLog -o ChangeLog
rm -f $tmp

# obfuscate emails <user@domain> and (user@domain)
sed -i -e 's,\([<(].*\)@\(.*[)>]\),\1/at/\2,g' ChangeLog
