#include <sys/types.h>
#include <sys/socket.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <netinet/in.h>
#include <linux/netlink.h>

void diep(char *err)
{
	perror(err);
	exit(1);
}

int main(int argc, char *argv[])
{
	int i;
	int *fds;
	int num_ports;
	struct sockaddr_nl local;

	srand(strtoul(argv[2], NULL, 0));

	if (argc < 3) {
		fprintf(stderr, "Usage: %s <PORTS> <SEED>\n", argv[0]);
		exit(1);
	}

	num_ports = atoi(argv[optind]);

	printf("Create %u ports\n", num_ports);

	fds = malloc(sizeof(int) * num_ports);
	for (i = 1; i <= num_ports; i++) {
		if (!(fds[i] = socket(PF_NETLINK, SOCK_RAW, 0)))
			diep("socket");

		memset(&local, 0, sizeof(local));
		local.nl_family = AF_NETLINK;
		local.nl_pid = rand();
		local.nl_groups = 0;
		if(bind(fds[i], (struct sockaddr *)&local, sizeof(local)) != 0){
			diep("socket");
		}
		
		if (!(i % 1000))
			printf("Created %u ports\n", i);

	}
	printf("Ports successfully created, terminating\n");

	return 0;
}
