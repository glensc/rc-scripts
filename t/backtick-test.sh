#!/bin/sh

# from man sh:

# NOTE:  $(command)  expressions are currently parsed by finding the matching paren-
# thesis, regardless of quoting.  This will hopefully be fixed soon.

# this script file will finally tell when 'soon' comes

a=1

ret_old=`
case $a in
	0)	echo "a=0";;
	1)	echo "a=1";;
	*)	echo "a!=[01]";;
esac
`

ret_new=$(
case $a in
	0)	echo "a=0";;
	1)	echo "a=1";;
	*)	echo "a!=[01]";;
esac
)

echo "$ret_old vs $ret_new"