#include <stdio.h>
#include <stdlib.h>
#include "../aritmetiikka/aritmetiikka.h"

int main(int argc, char* argv[])
{
	if(alkulukuko(strtoul(argv[1], (char**)NULL, 0)))
		printf("alkuluku\n");
	else
		printf("ei ole alkuluku\n");
	return 0;
}
