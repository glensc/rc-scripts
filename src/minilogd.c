/* minilogd.c
 * 
 * A pale imitation of syslogd. Most notably, doesn't write anything
 * anywhere except possibly back to syslogd.
 *
 * Copyright (c) 1999-2001 Red Hat, Inc. All rights reserved.
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
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <unistd.h>

#include <sys/poll.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/un.h>

static int we_own_log=0;
static char **buffer=NULL;
static int buflines=0;

int debug;

int recvsock;

void alarm_handler(int x) {
	alarm(0);
	close(recvsock);
	recvsock = -1;
}

void freeBuffer() {
   struct sockaddr_un addr;
   int sock;
   int x=0,conn;
   
   bzero(&addr,sizeof(addr));
   addr.sun_family = AF_LOCAL;
   strncpy(addr.sun_path,_PATH_LOG,sizeof(addr.sun_path)-1);
   /* wait for klogd to hit syslog */
   sleep(2);
   sock = socket(AF_LOCAL, SOCK_DGRAM,0);
   conn=connect(sock,(struct sockaddr *) &addr,sizeof(addr));
   while (x<buflines) {
      if (!conn) write(sock,buffer[x],strlen(buffer[x])+1);
      free(buffer[x]);
      x++;
   }
}

void cleanup(int exitcode) {
   /* If we own the log, unlink it before trying to free our buffer.
    * Otherwise, sending the buffer to /dev/log doesn't make much sense.... */
   if (we_own_log) {
      perror("wol");
      unlink(_PATH_LOG);
   }
   /* Don't try to free buffer if we were called from a signal handler */
   if (exitcode<=0) {
       if (buffer) freeBuffer();
       exit(exitcode);
   } else
      exit(exitcode+128);
}

void runDaemon(int sock) {
   struct sockaddr_un addr;
   int x,len,done=0;
   int addrlen = sizeof(struct sockaddr_un);
   char *message;
   struct stat s1,s2;
   struct pollfd pfds;
    
    daemon(0,-1);
    /* try not to leave stale sockets lying around */
    /* Hopefully, we won't actually get any of these */
    signal(SIGHUP,cleanup);
    signal(SIGINT,cleanup);
    signal(SIGQUIT,cleanup);
    signal(SIGILL,cleanup);
    signal(SIGABRT,cleanup);
    signal(SIGFPE,cleanup);
    signal(SIGSEGV,cleanup);
    signal(SIGPIPE,cleanup);
    signal(SIGBUS,cleanup);
    signal(SIGTERM,cleanup);
   done = 0;
   /* Get stat info on /dev/log so we can later check to make sure we
    * still own it... */
   if (stat(_PATH_LOG,&s1) != 0)
	  memset(&s1, '\0', sizeof(struct stat));
   while (!done) {
      pfds.fd = sock;
      pfds.events = POLLIN|POLLPRI;
      if ( ( (x=poll(&pfds,1,500))==-1) && errno !=EINTR) {
	 perror("poll");
	 cleanup(-1);
      }
      if ( (x>0) && pfds.revents & (POLLIN | POLLPRI)) {
	 message = calloc(8192,sizeof(char));
	 addrlen = sizeof(struct sockaddr_un);
	 recvsock = accept(sock,(struct sockaddr *) &addr, &addrlen);
	 if (recvsock == -1)
		      continue;
	 alarm(2);
	 signal(SIGALRM, alarm_handler);
	 len = recv(recvsock,message,8192,0);
	 alarm(0);
	 close(recvsock);
	 if (len>0) {
		 if (buflines < 200000) {
			 if (buffer)
			   buffer = realloc(buffer,(buflines+1)*sizeof(char *));
			 else
			   buffer = malloc(sizeof(char *));
			 message[strlen(message)]='\n';
			 buffer[buflines]=message;
			 buflines++;
		 }
	 }
	 else {
	    recvsock=-1;
	 }
      }
      if ( (x>0) && ( pfds.revents & (POLLHUP | POLLNVAL)) )
	done = 1;
      /* Check to see if syslogd's yanked our socket out from under us */
      if ( (stat(_PATH_LOG,&s2)!=0) ||
	    (s1.st_ino != s2.st_ino ) || (s1.st_ctime != s2.st_ctime) ||
	    (s1.st_mtime != s2.st_mtime) ) {
	 done = 1;
	 we_own_log = 0;
      }
   }
   cleanup(0);
}

int main(int argc, char **argv) {
   struct sockaddr_un addr;
   int sock;
   int pid;
    
   /* option processing made simple... */
   if (argc>1) debug=1;
   /* just in case */
   sock = open("/dev/null",O_RDWR);
   dup2(sock,0);
   dup2(sock,1);
   dup2(sock,2);
   close(sock);
	
   bzero(&addr, sizeof(addr));
   addr.sun_family = AF_LOCAL;
   strncpy(addr.sun_path,_PATH_LOG,sizeof(addr.sun_path)-1);
   sock = socket(AF_LOCAL, SOCK_STREAM,0);
   unlink(_PATH_LOG);
   /* Bind socket before forking, so we know if the server started */
   if (!bind(sock,(struct sockaddr *) &addr, sizeof(addr))) {
      we_own_log = 1;
      listen(sock,5);
      if ((pid=fork())==-1) {
	 perror("fork");
	 exit(3);
      }
      if (pid) {
	 exit(0);
      } else {
	  runDaemon(sock);
	  /* shouldn't get back here... */
	  exit(4);
      }
   } else {
      exit(5);
   }
}
