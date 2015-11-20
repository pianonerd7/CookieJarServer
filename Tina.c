#include <rpc/rpc.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/time.h>
#include <string.h>
#include "cookie.h"

const unsigned int RAND_RANGE = 5;
char *server;
CLIENT *client;
time_t t;

int getRand() {
	return ((rand() % RAND_RANGE));
}

void displayRequestStatus(int num) {
	switch(num) {
		case -2: printf("[Tina] The cookie jar is empty. \n");

		case 1: printf("[Tina] Got a cookie! \n");

		default: printf("[Tina] Unknown... try again. \n");
	}
}

int main (int argc, char *argv[]) {

	if (argc < 2) {
    printf("The server must be specified\n");
	printf("Usage: %s <hostname> \n",argv[0]);
	exit(1);
	}

	srand((unsigned int) time(&t));

	server = argv[1];

	struct returnStatus *status;
	struct param par; 
	par.userId = 0;

	if (client == NULL) {
		if ((client = clnt_create(server, MESSAGE_BOARD, MESSAGE_BOARD_VERSION, "udp")) == NULL) {
			clnt_pcreateerror(server);
			exit(1);
		}
	}

	while (status->cookieStatus != -2) {
		sleep(getRand());

		if ((status=getmemycookie(&par, client)) == NULL) {
			clnt_perror(client, server);
			clnt_destroy(client);
			exit(1);
		}

		displayRequestStatus(status->cookieStatus);
	}
}