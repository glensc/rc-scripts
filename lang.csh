#!/bin/csh
#
#	$Id: lang.csh,v 1.3 1999/12/15 18:41:05 misiek Exp $
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

#    # Set console font map.
#    if ($?UNIMAP) then
#	loadunimap $UNIMAP
#    endif

    if ($?SYSFONTACM) then
        switch ($SYSFONTACM)
            case iso01*|iso02*|iso15*|koi*|latin2-ucw*:
                if ( "$TERM" == "linux" ) then
                    if ( ls -l /proc/$$/fd/0 2>/dev/null | grep -- '-> /dev/tty[0-9]*$' >/dev/null 2>&1)  then
                        echo -n -e '\033(K' > /proc/$$/fd/0
                    endif
                endif
                breaksw
        endsw
    endif

    if ($?SYSTERM) then
    	switch ($SYSTERM)
	case linux-lat:
		setenv LESSCHARSET=latin1
		setenv INPUTRC=/etc/inputrc
		breaksw
	endsw
    endif
endif
