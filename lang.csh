#!/bin/csh
#
# $Id$
#

test -f /etc/sysconfig/i18n
if ($status == 0) then
	if ($?LANG) then
		setenv LANG
	endif
	if ($?LC_ALL) then
		setenv LC_ALL
	endif
	if ($?LINGUAS) then
		setenv LINGUAS
	endif
	if ($?SYSTERM) then
		setenv TERM=$SYSTERM
	endif
	if ($?_XKB_CHARSET) then
		setenv _XKB_CHARSET
	endif
	if ($?INPUTRC) then
		setenv INPUTRC
	endif
	if ($?LESSCHARSET) then
		setenv LESSCHARSET
	else if ($TERM == linux-lat) then
		setenv LESSCHARSET latin1
	endif
endif
