#include <popt.h>
#include <stdio.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>

typedef unsigned int int32;

int main(int argc, char ** argv) {
    int showBroadcast = 0, showNetwork = 0, showHostname = 0, showNetmask = 0, showShortNetmask = 0;
    int beSilent = 0;
    int rc;
    poptContext optCon;
    char * ipStr, * netmaskStr, * chptr;
    int32 ip, netmask, network, broadcast;
    struct hostent * hostinfo;
    char errBuf[250];
    struct poptOption optionsTable[] = {
	    { "broadcast", '\0', 0, &showBroadcast, 0 },
	    { "hostname", '\0', 0, &showHostname, 0 },
	    { "netmask", '\0', 0, &showNetmask, 0 },
	    { "network", '\0', 0, &showNetwork, 0 },
	    { "silent", '\0', 0, &beSilent, 0 },
	    { "prefix", '\0', 0, &showPrefix, 0 },
	    { NULL, '\0', 0, 0, 0 },
    };

    optCon = poptGetContext("ipcalc", argc, argv, optionsTable,0);
    poptReadDefaultConfig(optCon, 1);

    if ((rc = poptGetNextOpt(optCon)) < -1) {
	if (!beSilent)
	    fprintf(stderr, "ipcalc: bad argument %s: %s\n", 
		    poptBadOption(optCon, POPT_BADOPTION_NOALIAS), 
		    poptStrerror(rc));
	return 1;
    }

    if (!(ipStr = poptGetArg(optCon))) {
	if (!beSilent)
	    fprintf(stderr, "ipcalc: ip address expected\n");
	return 1;
    }

    if (showBroadcast || showNetwork) {
	if (!(netmaskStr = poptGetArg(optCon))) {
	    if (!beSilent)
		fprintf(stderr, "ipcalc: netmask expected\n");
	    return 1;
	}

	if (!inet_aton(netmaskStr, (struct in_addr *) &netmask)) {
	    if (!beSilent)
		fprintf(stderr, "ipcalc: bad netmask: %s\n", netmaskStr);
	    return 1;
	}
    }

    if ((chptr = poptGetArg(optCon))) {
	if (!beSilent)
	    fprintf(stderr, "ipcalc: unexpected argument: %s\n", chptr);
	return 1;
    }

    poptFreeContext(optCon);

    if (!inet_aton(ipStr, (struct in_addr *) &ip)) {
	if (!beSilent)
	    fprintf(stderr, "ipcalc: bad ip address: %s\n", ipStr);
	return 1;
    }

    if (showPrefix)
	    showNetmask = 1;

    if (showNetmask) {
	if (showPrefix) {
		if (((ntohl(ip) & 0xFF000000) >> 24) <= 127)
		    chptr = "8";
		else if (((ntohl(ip) & 0xFF000000) >> 24) <= 191)
		    chptr = "16";
		else 
		    chptr = "24";

		printf("PREFIX=%s\n", chptr);
		
	} else {
                if (((ntohl(ip) & 0xFF000000) >> 24) <= 127)
                    chptr = "255.0.0.0";
                else if (((ntohl(ip) & 0xFF000000) >> 24) <= 191)
                    chptr = "255.255.0.0";
                else
                    chptr = "255.255.255.0";

		printf("NETMASK=%s\n", chptr);
	}

    }

    if (showBroadcast) {
	broadcast = (ip & netmask) | ~netmask;
	printf("BROADCAST=%s\n", inet_ntoa(*((struct in_addr *) &broadcast)));
    }

    if (showNetwork) {
	network = ip & netmask;
	printf("NETWORK=%s\n", inet_ntoa(*((struct in_addr *) &network)));
    }

    if (showHostname) {
	hostinfo = gethostbyaddr((char *) &ip, sizeof(ip), AF_INET);
	if (!hostinfo) {
	    if (!beSilent) {
		sprintf(errBuf, "ipcalc: cannot find hostname for %s", ipStr);
		herror(errBuf);
	    }

	    return 1;
	}

	printf("HOSTNAME=%s\n", hostinfo->h_name);
    }
	

    return 0;
}
