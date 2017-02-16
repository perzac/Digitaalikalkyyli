#include <stdio.h>
#include <stdlib.h>
#include "aritmetiikka.h"

unsigned long int pi(unsigned long int n)
{
	if(n > alkuluvut_max())
	{
		fprintf(stderr, "Virhe: alkuluvut_max: suurin ohjelman tuntema alkuluku on %lu\n", alkuluvut_max());
		exit(1);
	}
	if(n < 2)
		return 0;

	unsigned long int ar = 0;
	unsigned long int yr = alkulkm();
	unsigned long int testi = 1;
	while(yr - ar > 1)
	{
		testi = (ar + yr)/2;
		if(ns_alkuluku(testi) == n)
			return testi;
		else if(ns_alkuluku(testi) < n)
			ar = testi;
		else
			yr = testi;
	}
	return ar;
}

unsigned long int *edel_ja_seur(unsigned long int n)
{
	static unsigned long int p[2];
	unsigned long int pi_n = pi(n);
	p[0] = ns_alkuluku(pi_n);
	p[1] = ns_alkuluku(pi_n + 1);
	return p;
}

unsigned long int ns_alkuluku(unsigned long int n)
{
	if(n > alkulkm())
	{
		fprintf(stderr, "Virhe: ns_alkuluku: ohjelma tuntee %lu alkulukua\n", alkulkm());
		exit(1);
	}
	if(n < 1)
	{
		fprintf(stderr, "Virhe: ns_alkuluku: argumentin oltava positiivinen\n");
		exit(1);
	}

	FILE *fp = fopen("../data/alkuluvut", "rb");
	fseek(fp, sizeof(unsigned long int)*(n - 1), SEEK_SET);
	unsigned long int p[1];
	fread(p, sizeof(unsigned long int), 1, fp);
	fclose(fp);
	return p[0];
}

/* tekijöihinjaossa vähän niin kuin oletetaan, että testattava luku on pienempi
 kuin suurimman tiedostossa olevan alkuluvun neliö. Tai siis oikeammin 
 kannustetaan ohjelman käyttäjää kasvattamaan tiedostoa niin, että suurin siellä
 oleva alkuluku ylittää 2^32 (tai on suurin tätä pienempi alkuluku). Virhettä
 ei voida julistaa ja ohjelmaa keskeyttää, koska suurimmalla osalla isoistakin
 luvuista on pieniä tekijöitä. */

unsigned long int *tekijoihinjako(unsigned long int n)
{
	if(n == 0)
	{
		fprintf(stderr, "Virhe: tekijoihinjako: 0:n tekijöihinjako määrittelemätön\n");
		exit(1);
	}
	static unsigned long int p[32];
	int i;
	for (i = 0; i < 32; i++) p[i] = 0;
	unsigned long int nj = neliojuuri(n);
	unsigned long int *alkuluku = malloc(sizeof(unsigned long int));
	*alkuluku = 2;
	FILE *fp = fopen("../data/alkuluvut", "rb");
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

unsigned long int neliojuuri(unsigned long int n)
{
	unsigned long int neliojuuri = 0;
	unsigned long int ynna = 1;
	
	while(ynna > 0)
	{
		ynna = 1;
		while((neliojuuri + ynna)*(neliojuuri + ynna) <= n)
			ynna *= 2;
		ynna /= 2;
		neliojuuri += ynna;
	}

	return neliojuuri;
}

unsigned long int neliojuuri_pariton(unsigned long int n)
{
	unsigned long int neliojuuri = 0;
	unsigned long int ynna = 1;
	
	while(ynna > 0)
	{
		ynna = 1;
		while((neliojuuri + ynna)*(neliojuuri + ynna) <= n)
			ynna *= 2;
		ynna /= 2;
		neliojuuri += ynna;
	}
	
	if(neliojuuri % 2 == 0)
		neliojuuri--;
	
	return neliojuuri;
}

unsigned long int alkulkm()
{
	unsigned long int lkm;
	FILE *fp = fopen("../data/alkuluvut", "rb");
	fseek(fp, 0, SEEK_END);
	unsigned long int koko = ftell(fp);
	fclose(fp);
	return (koko/(sizeof (unsigned long int)));
}

unsigned long int alkuluvut_max()
{
	unsigned long int p[1];
	FILE *fp = fopen("../data/alkuluvut", "rb");
	fseek(fp, (sizeof (unsigned long int))*(-1), SEEK_END);
	fread(p, sizeof (unsigned long int), 1, fp);
	fclose(fp);
	return *p;
}

char alkulukuko(unsigned long int n)
{
	if(n < 2)
		return 0;
	
	char alkuluku = 1;
	unsigned long int testaaja[1]; 
	FILE *fp = fopen("../data/alkuluvut", "rb");
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
