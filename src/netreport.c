/*
 * Copyright (c) 1997-2002 Red Hat, Inc. All rights reserved.
 *
 * This software may be freely redistributed under the terms of the GNU
 * public license.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 */
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

/* this will be running setgid root, so be careful! */

static void
usage(void) {
    fprintf(stderr, "usage: netreport [-r]\n");
    exit(1);
}

#define ADD 1
#define DEL 0
int main(int argc, char ** argv) {
    int action = ADD;
    /* more than long enough for "/var/run/netreport/<pid>\0" */
    char netreport_name[64];
    int  netreport_file;

    if (argc > 2) {
	usage();
    }

    if (argc > 1) {
	  if (argc == 2 && strcmp(argv[1], "-r") == 0) {
		  action = DEL;
	  } else {
		  usage();
	  }
    }

    snprintf(netreport_name, sizeof(netreport_name),
	     "/var/run/netreport/%d", getppid());
    if (action == ADD) {
	netreport_file = open(netreport_name,
			      O_EXCL|O_CREAT|O_WRONLY|O_TRUNC|O_NOFOLLOW, 0);
	if (netreport_file == -1) {
	    if (errno != EEXIST) {
		perror("Could not create netreport file");
		exit (1);
	    }
	} else {
	    close(netreport_file);
	}
    } else {
	/* ignore errors; not much we can do, won't hurt anything */
	unlink(netreport_name);
    }

    return 0;
}
