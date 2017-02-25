#include <stdio.h>
#include <stdlib.h>
#include "ariutils.h"

unsigned long int seuraava_alkuluku(unsigned long int n);

/* 
 * Suurin ohjelman tuntema seuraava_alkuluku
 * 
 * 		18446744073709551557
 * 
 * eli viimeinen alkuluku < 2^64
 * 
 */

int main(int argc, char *argv[])
{
	printf("%lu\n", seuraava_alkuluku(strtoul(argv[1], (char**)NULL, 0)));

	return 0;
}
