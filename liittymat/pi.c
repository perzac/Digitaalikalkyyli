#include <stdio.h>
#include "../aritmetiikka/aritmetiikka.h"

int main(int argc, char *argv[])
{
	printf("%lu\n", pi(strtoul(argv[1], (char**)NULL, 0)));

	return 0;
}
