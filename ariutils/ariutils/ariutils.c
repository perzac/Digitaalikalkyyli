#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ariutils.h"

void alkulukutiedostovirhe(char *kutsuja)
{
	fprintf(stderr,
			"Virhe: %s: Tiedostoa %s%s ei ole.\n",
			kutsuja, ENV, TDST);
	fprintf(stderr,
			"Voit luoda alkulukutiedoston ja kasvattaa "
			"sitä ohjelmalla \"laske_alkulukuja\".\n");
	exit(1);
}

void alkulukutiedostovaroitus(char *kutsuja)
{
	fprintf(stderr,
			"Varoitus: %s: Tiedoston %s%s suurin alkuluku on "
		    "pienempi kuin tekijöihinjaettavan luvun neliojuuri.\n",
			kutsuja, ENV, TDST);
	fprintf(stderr,
			"Voit kasvattaa alkulukutiedostoa ohjelmalla "
		    "\"laske_alkulukuja\".\n");
}

unsigned long int neliojuuri(unsigned long int n)
{
	unsigned long int neliojuuri = 0;
	unsigned long int ynna = 1;
	
	const unsigned long int isobitti = 0x80000000;
	
	if (n >= 0x4000000000000000)
	{
		ynna = isobitti;
		neliojuuri = ynna;
		ynna >>= 1;
		while(ynna > 0)
		{
			if((neliojuuri + ynna)*(neliojuuri + ynna) <= n)
				neliojuuri += ynna;
			ynna >>= 1;
		}
	}
	else while(ynna > 0)
	{
		ynna = 1;
		while((neliojuuri + ynna)*(neliojuuri + ynna) <= n)
			ynna <<= 1;
		ynna >>= 1;
		neliojuuri += ynna;
	}
	
	return neliojuuri;
}

unsigned long int alkuluvut_max()
{
	unsigned long int p[1];
	
	char polku[PATH_LENGTH];
	strcpy(polku, ENV);
	strcat(polku, TDST);
	
	FILE *fp = fopen(polku, "rb");
	if(!fp) alkulukutiedostovirhe("alkuluvut_max");
	fseek(fp, (sizeof (unsigned long int))*(-1), SEEK_END);
	fread(p, sizeof (unsigned long int), 1, fp);
	fclose(fp);
	return *p;
}

unsigned long int alkulkm()
{
	unsigned long int lkm;
	
	char polku[PATH_LENGTH];
	strcpy(polku, ENV);
	strcat(polku, TDST);
	
	FILE *fp = fopen(polku, "rb");
	if(!fp) alkulukutiedostovirhe("alkulkm");
	
	fseek(fp, 0, SEEK_END);
	unsigned long int koko = ftell(fp);
	fclose(fp);
	return (koko/(sizeof (unsigned long int)));
}

unsigned long int ns_alkuluku(unsigned long int n)
{
	char polku[PATH_LENGTH];
	strcpy(polku, ENV);
	strcat(polku, TDST);
	
	FILE *fp = fopen(polku, "rb");
	if(!fp) alkulukutiedostovirhe("ns_alkuluku");
	fseek(fp, 0, SEEK_END);
	unsigned long int ylaraja = (ftell(fp)/(sizeof (unsigned long int)));
	
	if(n > ylaraja)
	{
		fprintf(stderr,
				"Virhe: ns_alkuluku: "
				"ohjelma tuntee %lu alkulukua\n",
				ylaraja);
		exit(1);
	}
	if(n < 1)
	{
		fprintf(stderr,
				"Virhe: ns_alkuluku: "
				"argumentin oltava nollaa suurempi\n");
		exit(1);
	}
	
	fseek(fp, sizeof(unsigned long int)*(n - 1), SEEK_SET);
	unsigned long int p[1];
	fread(p, sizeof(unsigned long int), 1, fp);
	fclose(fp);
	return p[0];
}

unsigned long int pi(unsigned long int n)
{
	unsigned long int p[1];
	
	char polku[PATH_LENGTH];
	strcpy(polku, ENV);
	strcat(polku, TDST);
	
	FILE *fp = fopen(polku, "rb");
	if(!fp) alkulukutiedostovirhe("pi");
	fseek(fp, (sizeof (unsigned long int))*(-1), SEEK_END);
	fread(p, sizeof (unsigned long int), 1, fp);
	
	if(n > *p)
	{
		fprintf(stderr,
				"Virhe: pi: suurin ohjelman tuntema "
				"alkuluku on %lu.\n",*p);
		exit(1);
	}
	if(n < 2)
		return 0;

	unsigned long int ar = 0;
	fseek(fp, 0, SEEK_END);
	unsigned long int yr = (ftell(fp)/(sizeof (unsigned long int)));;
	unsigned long int testi = 1;
	while(yr - ar > 1)
	{
		testi = (ar + yr)/2;
		fseek(fp, sizeof(unsigned long int)*(testi - 1), SEEK_SET);
		fread(p, sizeof(unsigned long int), 1, fp);
		if(*p == n)
			return testi;
		else if(*p < n)
			ar = testi;
		else
			yr = testi;
	}
	
	fclose(fp);
	
	return ar;
}

/* tekijöihinjaossa vähän niin kuin oletetaan, että testattava luku on
 * pienempi kuin suurimman tiedostossa olevan alkuluvun neliö. Tai siis
 * oikeammin kannustetaan ohjelman käyttäjää kasvattamaan tiedostoa
 * niin, että suurin siellä oleva alkuluku ylittää 2^32 (tai on suurin
 * tätä pienempi alkuluku). Virhettä ei voida julistaa ja ohjelmaa
 * keskeyttää, koska suurimmalla osalla isoistakin luvuista on pieniä
 * tekijöitä. */

unsigned long int *tekijoihinjako(unsigned long int n)
{
	if(n == 0)
	{
		fprintf(stderr,
				"Virhe: tekijoihinjako: "
				"0:n tekijöihinjako määrittelemätön\n");
		exit(1);
	}
	static unsigned long int p[32];
	int i;
	for (i = 0; i < 32; i++) p[i] = 0;
	
	unsigned long int nj = neliojuuri(n);
	if(nj > alkuluvut_max()) alkulukutiedostovaroitus("tekijoihinjako");
	
	unsigned long int *alkuluku = malloc(sizeof(unsigned long int));
	*alkuluku = 2;
	
	char polku[PATH_LENGTH];
	strcpy(polku, ENV);
	strcat(polku, TDST);
	
	FILE *fp = fopen(polku, "rb");
	if(!fp) alkulukutiedostovirhe("tekijoihinjako");
	fseek(fp, sizeof(unsigned long int), SEEK_SET);
	i = -1;
	while(*alkuluku <= nj)
	{	
		if(n % *alkuluku == 0)
		{
			n /= *alkuluku;
			if(i == -1)
			{
				i++;
				p[i] = *alkuluku;
			}
			else if(p[i] != *alkuluku)
			{
				i += 2;
				p[i] = *alkuluku;
			}
			p[i + 1] += 1;
			continue;
		}
		fread(alkuluku, sizeof(unsigned long int), 1, fp);
		nj = neliojuuri(n);
	}
	fclose(fp);
	free(alkuluku);
	if(i == -1)
	{
		p[0] = n;
		p[1] = 1;
	}
	else if(n > 1)
	{
		i += 2;
		p[i] = n;
		p[i + 1] = 1;
	}
	return p;
}

char alkulukuko(unsigned long int n)
{
	if(n < 2)
		return 0;
	
	char alkuluku = 1;
	unsigned long int testaaja[1];
	
	char polku[PATH_LENGTH];
	strcpy(polku, ENV);
	strcat(polku, TDST);
	
	FILE *fp = fopen(polku, "rb");
	if(!fp) alkulukutiedostovirhe("alkulukuko");
	fseek(fp, 0, SEEK_SET);
	fread(testaaja, sizeof(unsigned long int), 1, fp);
	unsigned long int nj = neliojuuri(n);
	while(*testaaja <= nj)
	{
		if(n % *testaaja == 0)
		{
			alkuluku = 0;
			break;
		}
		fread(testaaja, sizeof(unsigned long int), 1, fp);
	}
	return alkuluku;
}

/* 
 * Suurin ohjelman tuntema seuraava_alkuluku
 * 
 * 		18446744073709551557
 * 
 * eli viimeinen alkuluku < 2^64
 * 
 */


unsigned long int seuraava_alkuluku(unsigned long int n)
{
	unsigned long int max[1];
	
	char polku[PATH_LENGTH];
	strcpy(polku, ENV);
	strcat(polku, TDST);
	
	FILE *fp = fopen(polku, "rb");
	if(!fp) alkulukutiedostovirhe("seuraava_alkuluku");
	fseek(fp, (sizeof (unsigned long int))*(-1), SEEK_END);
	fread(max, sizeof (unsigned long int), 1, fp);
	unsigned long int yr = (ftell(fp)/(sizeof (unsigned long int)));
	
	if(n > *max)
	{
		char alkuluku = 0;
		unsigned long int testaaja[1];
		if (n % 2 == 0) ++n;
		while(!alkuluku)
		{
			alkuluku = 1;
			fseek(fp, sizeof(unsigned long int), SEEK_SET);
			fread(testaaja, sizeof(unsigned long int), 1, fp);
			unsigned long int nj = neliojuuri(n);
			while(*testaaja <= nj)
			{
				if(n % *testaaja == 0)
				{
					alkuluku = 0;
					break;
				}
				fread(testaaja, sizeof(unsigned long int), 1, fp);
			}
			n += 2;
		}
		fclose(fp);
		if(n == 3)
		{
			fprintf(stderr, "Virhe: seuraava_alkuluku: ohjelma "
			"ei osaa laskea 18446744073709551557 suurempaa alkulukua\n");
			exit(1);
		}
		return n - 2;
	}
	else if (n < 3)
	{
		fclose(fp);
		return 2;
	}
	else
	{
		unsigned long int ar = 0;
		unsigned long int testi = 1;
		unsigned long int p[1];
		while(yr - ar > 1)
		{
			testi = (ar + yr)/2;
			fseek(fp, sizeof(unsigned long int)*(testi - 1), SEEK_SET);
			fread(p, sizeof(unsigned long int), 1, fp);
			if(*p == n)
			{
				yr = testi;
				break;
			}
			else if(*p < n)
				ar = testi;
			else
				yr = testi;
		}
		
		fseek(fp, sizeof(unsigned long int)*(ar - 1), SEEK_SET);
		fread(p, sizeof(unsigned long int), 1, fp);
		fclose(fp);
		
		return *p;
	}
	
}

unsigned long int edellinen_alkuluku(unsigned long int n)
{
	unsigned long int max[1];
	
	char polku[PATH_LENGTH];
	strcpy(polku, ENV);
	strcat(polku, TDST);
	
	FILE *fp = fopen(polku, "rb");
	if(!fp) alkulukutiedostovirhe("edellinen_alkuluku");
	fseek(fp, (sizeof (unsigned long int))*(-1), SEEK_END);
	fread(max, sizeof (unsigned long int), 1, fp);
	unsigned long int yr = (ftell(fp)/(sizeof (unsigned long int)));
	
	if(n > *max)
	{
		char alkuluku = 0;
		unsigned long int testaaja[1];
		if (n % 2 == 0) --n;
		while(!alkuluku)
		{
			alkuluku = 1;
			fseek(fp, sizeof(unsigned long int), SEEK_SET);
			fread(testaaja, sizeof(unsigned long int), 1, fp);
			unsigned long int nj = neliojuuri(n);
			while(*testaaja <= nj)
			{
				if(n % *testaaja == 0)
				{
					alkuluku = 0;
					break;
				}
				fread(testaaja, sizeof(unsigned long int), 1, fp);
			}
			n -= 2;
		}
		fclose(fp);
		return n + 2;
	}
	else if (n < 2)
	{
		fclose(fp);
		fprintf(stderr, "edellinen_alkuluku: Pienin alkuluku on 2.\n");
		exit(1);
	}
	else
	{
		unsigned long int ar = 0;
		unsigned long int testi = 1;
		unsigned long int p[1];
		while(yr - ar > 1)
		{
			testi = (ar + yr)/2;
			fseek(fp, sizeof(unsigned long int)*(testi - 1), SEEK_SET);
			fread(p, sizeof(unsigned long int), 1, fp);
			if(*p == n)
			{
				ar = testi;
				break;
			}
			else if(*p < n)
				ar = testi;
			else
				yr = testi;
			
		}
		fseek(fp, sizeof(unsigned long int)*(ar - 1), SEEK_SET);
		fread(p, sizeof(unsigned long int), 1, fp);
		fclose(fp);
		
		return *p;
	}
				
}
