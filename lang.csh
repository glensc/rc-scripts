#!/bin/csh
#
#	$Id: lang.csh,v 1.2 1999/07/13 12:49:34 misiek Exp $
#

if [ -f /etc/sysconfig/i18n ]; then
    . /etc/sysconfig/i18n

    if [ -n "$LANG" ]; then
	setenv LANG
    fi

    if [ -n "$LC_ALL" ]; then
	setenv LC_ALL
    fi
  
    if [ -n "$LINGUAS" ]; then
	setenv LINGUAS
    fi
  
    if [ -n "$SYSTERM" ]; then
	setenv TERM=$SYSTERM
    fi

    # Set console font map.
    if [ -n "$UNIMAP" ]; then
	loadunimap $UNIMAP
    fi

    if [ -n "$SYSTERM" ] ; then
	case $SYSTERM in
	    linux-lat)
		setenv LESSCHARSET=latin1
		setenv INPUTRC=/etc/inputrc
		;;
	esac
    fi
fi
