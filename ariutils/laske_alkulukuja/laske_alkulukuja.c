#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ariutils.h"

void aloitus(unsigned long int lisays);

void taydennys(unsigned long int lisays);

unsigned long int maaraa_kandi();

unsigned long int *maaraa_p(unsigned long int neliojuuri,
							unsigned long int lisays);

int lg_2(unsigned long int n);


/* tiedostoon: Globaali muuttuja; laskee ohjelman suorituksen aikana
 * tiedostoon lisättyjen alkulukujen lkm:n */
unsigned long int tiedostoon = 0; 
unsigned long int kok_lisays;


int main(int argc, char* argv[])
{
	unsigned long int lisays;
	char maara[20];
	
	/* luetaan lisättävien alkulukujen määrä käyttäjän syötteestä. */
	if(argc == 1)
	{
		printf("Tiedostossa \"alkuluvut\" on yhteensä %lu alkulukua.\n",
			   alkulkm());
		printf("Näistä suurin on %lu.\n", alkuluvut_max());
		printf("Kuinka monta alkulukua lasketaan?\n");
		printf("Yli miljoonan alkuluvun lisäystä ei ole "
		       "suositeltavaa tehdä kerralla.\n");
		fgets(maara, 19, stdin);
		lisays = strtoul(maara, (char**)NULL, 0);
	}
	else /* Luetaan komentoriviparametri kokonaislukuarvoiseen muuttujaan. */
		lisays = strtoul(argv[1], (char**)NULL, 0);
	
	if(lisays > 1000000)
	{
		fprintf(stderr,
				"Yli miljoonan alkuluvun lisäystä ei ole "
				"suositeltavaa tehdä kerralla.\n");
		fprintf(stderr, "Ei laskettu alkulukuja.\n");
		exit(1);
	}

	/* Asetetaan globaalin muuttujan kok_lisays arvoksi koko ohjelman
	 * suorituksen aikana tiedostoon lisättävien alkulukujen lukumäärä. */
	kok_lisays = lisays;
	
	FILE *fp;
	char polku[PATH_LENGTH];
	strcpy(polku, ENV);
	strcat(polku, TDST);
	
	/* Tarkastetaan, onko tiedosto luomatta. */
	if(!(fp = fopen(polku, "rb")))
		aloitus(lisays);
	else
	{
		unsigned long int lkm;
		fseek(fp, 0, SEEK_END);
		lkm = ftell(fp) / (sizeof(unsigned long int));
		fclose(fp);
		if(lkm == 0)		/* Jos tiedosto on tyhjä */
			aloitus(lisays);
		else
			taydennys(lisays);
	}
	
	printf("Lisätty %lu alkulukua tiedostoon \"alkuluvut\".\n",
		   tiedostoon);
	printf("Tiedostossa \"alkuluvut\" on yhteensä %lu alkulukua.\n",
		   alkulkm());
	printf("Tiedoston \"alkuluvut\" suurin luku on %lu.\n",
		   alkuluvut_max());

	return 0;
}


void aloitus(unsigned long int lisays)
{
	char polku[PATH_LENGTH];
	strcpy(polku, ENV);
	strcat(polku, TDST);
	
	FILE *fp = fopen(polku, "rb");
	if(lisays > 0)
	{
		unsigned long int *p;
		p[0] = 2;
		fwrite(p, sizeof(unsigned long int), 1, fp);
		tiedostoon++;
	}
	fclose(fp);
	
	unsigned long int uusi_lisays = lisays - 1;
	if(uusi_lisays < 0)
		uusi_lisays = 0;
	taydennys(uusi_lisays);
}


void taydennys(unsigned long int lisays)
{
	if(lisays < 1) return;

	unsigned long int kandi = maaraa_kandi();
	unsigned long int nelioj = neliojuuri(kandi);
	if(kandi == nelioj*nelioj)
		kandi += 2;

	/* testaavat alkuluvut */
	unsigned long int *p = maaraa_p(nelioj, lisays);
	
	/* Jotta siirrytään oikean luvun testaamiseen, kun on pyöritetty
	 * maaraa_p:n sisällä taydennysta */
	kandi = maaraa_kandi();
	nelioj = neliojuuri(kandi);
	if(kandi == nelioj*nelioj)
		kandi += 2;
	
	unsigned long int p_uudet[lisays];
	
	unsigned long int p_i;
	char alkuluku;
	
	/* indeksi lähtee 0:sta*/
	unsigned long int neliosta = (kandi-nelioj*nelioj)/2 - 1;
	
	/* kandin kasvatusten lkm ennen neliojuuren kasvatusta */
	unsigned long int nelioon = 2*nelioj + 1;
	unsigned long int lisatty = 0;
	
	if(lisays > kok_lisays - tiedostoon)
		lisays = kok_lisays - tiedostoon;
	
	char riittaa = (lisatty == lisays);
	
	while(!riittaa)
	{
		while(neliosta < nelioon)
		{
			alkuluku = 1;
			p_i = -1;
			do
			{
				p_i++;
				if(kandi % p[p_i] == 0)
				{
					alkuluku = 0;
					break;
				}
			} while(p[p_i] < nelioj);
			if(alkuluku)
			{
				p_uudet[lisatty] = kandi;
				lisatty++;
				if(lisatty == lisays)
				{
					riittaa = 1;
					break;
				}
			}
			kandi += 2;
			neliosta++;
		}
		neliosta = 0;
		kandi += 2;		/* kandi hyppää neliön yli */
		nelioj += 2;	/* nelioj kasvaa seuraavaan parittomaan */
		nelioon += 4;
	}
	free(p);
	
	char polku[PATH_LENGTH];
	strcpy(polku, ENV);
	strcat(polku, TDST);
	
	FILE *fp = fopen(polku, "rb");
	fseek(fp, 0, SEEK_END);
	fwrite(p_uudet, sizeof(unsigned long int), lisays, fp);
	tiedostoon += lisays;
	fclose(fp);
}

unsigned long int maaraa_kandi()
{
	char polku[PATH_LENGTH];
	strcpy(polku, ENV);
	strcat(polku, TDST);
	
	FILE *fp = fopen(polku, "rb");
	unsigned long int tmp[1];
	fseek(fp, sizeof(unsigned long int)*(-1), SEEK_END);
	fread(tmp, sizeof(unsigned long int), 1, fp);
	fclose(fp);
	if(tmp[0] == 2)
		tmp[0] = 1;
	return tmp[0] + 2;
}

unsigned long int *maaraa_p(unsigned long int neliojuuri,
							unsigned long int lisays)
{
	unsigned long int i = 0;
	if(lisays > 1)
	{
		while(i < lisays)
		{
			/* approksimoitu varman päälle */
			i += 2*(neliojuuri + 1)/lg_2(neliojuuri + 2);
			neliojuuri += 2;
		}
	}


	while(neliojuuri > alkuluvut_max())
	{
		unsigned long int uusi_lisays = alkulkm();
		if(uusi_lisays > kok_lisays - tiedostoon)
			uusi_lisays = kok_lisays - tiedostoon;
		taydennys(uusi_lisays);
	}
	
	unsigned long int nj_maara = pi(neliojuuri) + 1;

	unsigned long int *p =
		(unsigned long int *)
		malloc(sizeof(unsigned long int)*nj_maara);
	
	char polku[PATH_LENGTH];
	strcpy(polku, ENV);
	strcat(polku, TDST);
	
	FILE *fp = fopen(polku, "rb");
	fseek(fp, 0, SEEK_SET);
	fread(p, sizeof(unsigned long int), nj_maara, fp);
	fclose(fp);

	return p;
}

int lg_2 (unsigned long int n)
{
	int i = 0;
	while(n > 1)
	{
		n /= 2;
		i++;
	}
	return i;
}
