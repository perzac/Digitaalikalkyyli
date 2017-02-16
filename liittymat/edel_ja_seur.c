#include <stdio.h>
#include <stdlib.h>
#include "../aritmetiikka/aritmetiikka.h"

int main(int argc, char *argv[])
{
	unsigned long int *p = edel_ja_seur(strtoul(argv[1], (char**)NULL, 0));
	printf("%lu \t%lu\n", p[0], p[1]);

	return 0;
}
