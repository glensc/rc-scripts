#!/bin/sh
#
#	$Id$
#

if [ -f /etc/sysconfig/i18n ]; then
	. /etc/sysconfig/i18n

	[ -n "$LANG" ] && export LANG || unset LANG
	[ -n "$LC_CTYPE" ] && export LC_CTYPE || unset LC_CTYPE
	[ -n "$LC_COLLATE" ] && export LC_COLLATE || unset LC_COLLATE
	[ -n "$LC_MESSAGES" ] && export LC_MESSAGES || unset LC_MESSAGES
	[ -n "$LC_NUMERIC" ] && export LC_NUMERIC || unset LC_NUMERIC
	[ -n "$LC_MONETARY" ] && export LC_MONETARY || unset LC_MONETARY
	[ -n "$LC_TIME" ] && export LC_TIME || unset LC_TIME
	[ -n "$LC_ALL" ] && export LC_ALL || unset LC_ALL
	[ -n "$LANGUAGE" ] && export LANGUAGE || unset LANGUAGE
	[ -n "$LINGUAS" ] && export LINGUAS || unset LINGUAS

	[ -n "$_XKB_CHARSET" ] && export _XKB_CHARSET || unset _XKB_CHARSET

	# deprecated
	if [ -n "$SYSTERM" ]; then
		export TERM=$SYSTERM
	fi

	if [ -n "$INPUTRC" ]; then
		export INPUTRC
	fi

	if [ -n "$LESSCHARSET" ]; then
		export LESSCHARSET
	elif [ "$TERM" = "linux-lat" ]; then
		LESSCHARSET=latin1
		export LESSCHARSET
	fi
fi

# This must be last line !
# vi:syntax=sh
