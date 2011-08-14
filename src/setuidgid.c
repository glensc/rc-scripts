/*
    Simple wrapper to run a command with different uid/gid.

    Based on the implementation in freedt:
       Copyright (C) 2003  Adam Sampson <azz@gnu.org>

    2010-05-07 – Jacek Konieczny <jajcus> updated for standalone compilation
    and included in PLD rc-scripts

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

#include <string.h>
#include <sys/param.h>
#include <pwd.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <grp.h>
#include <limits.h>

const char *progname = "setuidgid";
const char *proghelp =
	"Usage: setuidgid [OPTIONS] account command ...\n"
	"Run a command under the uid and gid of an account.\n\n"
	"-s        Also set supplementary groups\n";

void die(const char *msg) {
	fprintf(stderr, "%s: %s\n", progname, msg);
	exit(1);
}
void die2(const char *msg1, const char *msg2) {
	fprintf(stderr, "%s: %s: %s\n", progname, msg1, msg2);
	exit(1);
}
void show_version() {
	fprintf(stderr, "%s $Rev$ (PLD Linux rc-scripts)\n", progname);
}
void version() {
	show_version();
	exit(0);
}
void help(int retval) {
	show_version();
	fprintf(stderr, "\n%s"
		"-V        Show version information\n"
		"-h        Show usage information\n", proghelp);
	exit(retval);
}

int main(int argc, char **argv) {
	struct passwd *p;
	int use_supp = 0;

	while (1) {
		int c = getopt(argc, argv, "+V?hs");
		if (c == -1)
			break;

		switch (c) {
		case 's':
			use_supp = 1;
			break;
		case 'V':
			version();
		case 'h':
		case '?':
			help(0);
		default:
			help(1);
		}
	}

	if ((argc - optind) < 2)
		help(1);

	p = getpwnam(argv[optind]);
	if (!p)
		die("no such account");
	if (setgid(p->pw_gid) < 0)
		die("unable to setgid");

	if (use_supp) {
		gid_t groups[NGROUPS_MAX];
		size_t n = 0;

		setgrent();
		while (1) {
			char **p;
			struct group *g = getgrent();
			if (g == NULL)
				break;

			for (p = g->gr_mem; *p != NULL; p++) {
				if (strcmp(*p, argv[optind]) == 0) {
					if (n >= NGROUPS_MAX)
						die("too many groups");
					groups[n++] = g->gr_gid;
				}
			}
		}

		if (setgroups(n, groups) < 0)
			die("unable to setgroups");
	} else {
		if (setgroups(1, &p->pw_gid) < 0)
			die("unable to setgroups");
	}

	if (setuid(p->pw_uid) < 0)
		die("unable to setuid");

	++optind;
	execvp(argv[optind], &argv[optind]);
	die2(argv[optind], "unable to exec");

	return 0; /* NOTREACHED */
}

