#include <sys/param.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

int main(int argc, char ** argv) {
    char *buf = calloc (MAXPATHLEN+1, sizeof(char));
    
    if (argc<1) return 1;
    (void) readlink (argv[1], buf, MAXPATHLEN);
    fprintf (stdout, "%s", buf);
    exit (0);
    }
