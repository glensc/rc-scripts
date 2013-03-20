#!/bin/sh

# run-parts - concept taken from Debian
#
# modified for PLD Linux by Pawel Wilk <siefca@pld-linux.org>
#
# NOTE:
#	1.) run-parts is now able to get arguments!
#	2.) relative pathname of the invoked directory can be
#	    obtained by reading RUNPARTS_DIR env. variable
#	3.) absolute pathname of the invoked directory can be
#	    obtained by reading RUNPARTS_ADIR env. variable
#

# keep going when something fails
set +e

if [ "$1" = "--test" ]; then
	test=yes
	shift
fi

if [ "$1" = "--" ]; then
	shift
fi

# std checks
if [ $# -lt 1 ]; then
	echo "Usage: run-parts [-u] [--test] <dir> <args...>"
	exit 1
fi

if [ ! -d $1 ]; then
	echo "Is not a directory: $1"
	echo "Usage: run-parts [-u] [--test] <dir> <args...>"
	exit 1
fi

# assign passed dir name
RUNPARTS_DIR=$1

# assign absolute dir name
olddir=$(pwd)
cd $RUNPARTS_DIR
RUNPARTS_ADIR=$(pwd)
cd $olddir
unset olddir

# export directories for our descendants
export RUNPARTS_ADIR RUNPARTS_DIR

# shift args
shift

# Ignore *~ and *, scripts
for i in $RUNPARTS_DIR/*[!~,] ; do
	[ -d "$i" ] && continue
	# Don't run *.{rpmsave,rpmorig,rpmnew,swp} scripts
	[ "${i%.rpmsave}" != "${i}" ] && continue
	[ "${i%.rpmorig}" != "${i}" ] && continue
	[ "${i%.rpmnew}" != "${i}" ] && continue
	[ "${i%.swp}" != "${i}" ] && continue
	[ "${i%,v}" != "${i}" ] && continue

	if [ -x "$i" ]; then
		runprog="$i $@"
		if [ "$test" = yes ]; then
			echo "$runprog"
			continue
		fi
		$runprog 2>&1 | awk -v "progname=$i" \
			'progname {
			 	print progname ":\n"
				progname="";
				}
			{ print; }'
	fi
done

exit 0
