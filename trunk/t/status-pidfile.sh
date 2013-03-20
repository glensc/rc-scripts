#!/bin/sh

# broken check with --pidfile specified:
#
# $ (. /etc/rc.d/init.d/functions; status --pidfile /var/run/naviagent/agent.pid naviagent)
# naviagent (pid 12788) is running...
#
# $ ls -l /proc/`cat /var/run/naviagent/agent.pid`
# ls: cannot access /proc/12788: No such file or directory

lib=$(dirname "$0")/..
tmp=$(mktemp -d)

# TODO: rc_cache_init should be able to use tmp dir, not real root
. $lib/rc.d/init.d/functions

# first unused pid
pid=9999999 # may not exist
procname=testd # irrelevant
pidfile=$tmp/agent.pid

if [ -d /proc/$pid ]; then
	echo >&2 "bad pid chosen for test, /proc/$pid exists"
	exit 1
fi

echo $pid > $pidfile
status --pidfile $pidfile $procname
rc=$?
if [ $rc = 0 ]; then
	echo "FAIL: should not say process is running"
	rv=1
else
	echo "OK: process is not running"
	rv=0
fi

rm -rf $tmp
exit $rv
