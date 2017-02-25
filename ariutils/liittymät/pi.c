#include <stdio.h>
#include <stdlib.h>
#include "ariutils.h"

unsigned long int pi(unsigned long int n);

int main(int argc, char *argv[])
{
	printf("%lu\n", pi(strtoul(argv[1], (char**)NULL, 0)));

	return 0;
}
