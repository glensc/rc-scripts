/* 
 * usleep
 * 
 * Written by Donald Barnes <djb@redhat.com> for Red Hat Software.
 * $Id: usleep.c,v 1.2 1999/09/02 12:11:06 misiek Exp $
 */

#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <libintl.h>
#include <locale.h>

int main(int argc, char **argv)
{

  double count;

  if (argc == 1) count=1;
  else if (!strcmp(argv[1], "--help"))
    {
    printf("usleep [number]\n	sleep [number] of microseconds\n	the default number to sleep is 1 microsecond\n");
    exit(0);
    }
  else if (!strcmp(argv[1], "-v"))
    {
    printf("usleep version 1.0 by Donald Barnes <djb@redhat.com>\n	usleep --help for more info\n");
    exit(0);
    }
  else 
      count = strtod(argv[1], NULL); 

  usleep(count);
  exit(0);


} 
