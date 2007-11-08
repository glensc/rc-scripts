/*
 * usleep.c     Sleep for the specified number of microseconds
 *
 * Usage:       usleep [ microseconds ]
 *
 * Copyright 2001 Werner Fink, 2001 SuSE GmbH Nuernberg, Germany.
 * Copyright 2005 Werner Fink, 2005 SUSE LINUX Products GmbH, Germany.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * Author:      Werner Fink <werner@suse.de>
 */

#ifndef  __USE_STRING_INLINES
# define __USE_STRING_INLINES
#endif
#ifdef   __NO_STRING_INLINES
# undef  __NO_STRING_INLINES
#endif
#include <libgen.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#ifdef _POSIX_PRIORITY_SCHEDULING
# include <sched.h>
#endif
#define USAGE		"Usage:\t%s [ microseconds ]\n", we_are

static char *we_are;
int main(int argc, char **argv)
{
    unsigned long int usec = 1;

    if (argc > 2)
	goto err;

    if (argc > 1) {
	char *endptr;
	usec = strtoul(argv[1], &endptr, 10);
	if (*endptr != '\0')
	    goto err;
    }

    if (usec)
	usleep(usec);
#ifdef _POSIX_PRIORITY_SCHEDULING
    else
	(void)sched_yield();
#endif
    _exit(0);

    /* Do this at the end for speed */
err:
    we_are = basename(argv[0]);
    fprintf(stderr, USAGE);

    if (argc > 1 && *(argv[1]) == '-') {
	argv[1]++;
	if (!strcmp(argv[1], "-help") || *(argv[1]) == 'h' || *(argv[1]) == '?') {
	    fprintf(stderr, "Sleep for the specified number of microseconds.\n\n");
	    fprintf(stderr, "Help options:\n");
	    fprintf(stderr, "  -h, -?, --help    display this help and exit.\n");
	    exit (0);
	}
    }
    exit (1);
}
