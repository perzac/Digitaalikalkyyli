#include <stdio.h>
#include <stdlib.h>
#include "../aritmetiikka/aritmetiikka.h"

int main(int argc, char *argv[])
{
	unsigned long int *p = tekijoihinjako(strtoul(argv[1], (char**)NULL, 0));
	int i;
	for(i = 0; i < 32; i += 2)
	{
		if(p[i] == 0)
			break;
		if(i != 0)
			printf("*");
		if(p[i + 1] == 1)
			printf("%lu", p[i]);
		else
			printf("%lu^%lu", p[i], p[i + 1]);
	}
	printf("\n");
	
	return 0;
}
