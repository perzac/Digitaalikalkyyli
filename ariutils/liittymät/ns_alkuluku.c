#include <stdio.h>
#include <stdlib.h>
#include "ariutils.h"

int main(int argc, char *argv[])
{
	printf("%lu\n", ns_alkuluku(strtoul(argv[1], (char**)NULL, 0)));

	return 0;
}
