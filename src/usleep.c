/* 
 * usleep
 * 
 * Written by Donald Barnes <djb@redhat.com> for Red Hat, Inc.
 * 
 * Copyright (c) 1997-2003 Red Hat, Inc. All rights reserved.
 *
 * This software may be freely redistributed under the terms of the GNU
 * public license.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 */


#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "popt.h"

int main(int argc, char **argv) {
  unsigned long count;
  poptContext optCon;
  int showVersion = 0;
  int showOot = 0;
  int rc;
  char * countStr = NULL;
  struct poptOption options[] = {
            { "version", 'v', POPT_ARG_NONE, &showVersion, 0, 
			"Display the version of this program, and exit" },
            { "oot", 'o', POPT_ARG_NONE, &showOot, 0, 
			"oot says hey!" },
	    POPT_AUTOHELP
            { 0, 0, 0, 0, 0 }
        };

  optCon = poptGetContext("usleep", argc, argv, options,0);
  /*poptReadDefaultConfig(optCon, 1);*/
  poptSetOtherOptionHelp(optCon, "[microseconds]");

  if ((rc = poptGetNextOpt(optCon)) < -1) {
	fprintf(stderr, "usleep: bad argument %s: %s\n", 
		poptBadOption(optCon, POPT_BADOPTION_NOALIAS), 
		poptStrerror(rc));
	return 2;
  }

  if (showVersion) {
      printf("usleep version 1.2\n	usleep --help for more info\n");
      return 0;
  }

  if (showOot) {
      printf("oot says hey!\n");
      return 0;
  }

  countStr = poptGetArg(optCon);

  if (countStr == NULL) count = 1;

  else if (countStr && poptGetArg(optCon)) {
      fprintf(stderr, "%s: exactly one argument (number of microseconds) "
      		"must be used\n", argv[0]);
      return 2;
  }

  else count = strtoul(countStr, NULL, 0); 

  usleep(count);
  return 0;
} 
