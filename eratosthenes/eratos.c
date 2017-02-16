#include <stdio.h>
#include <stdlib.h>

void aloitus(unsigned long int lisays);
void taydennys(unsigned long int lisays);
unsigned long int maaraa_kandi();
unsigned long int maaraa_neliojuuri(unsigned long int kandi);
unsigned long int *maaraa_p(unsigned long int neliojuuri, unsigned long int lisays);
int lg_2(unsigned long int n);
unsigned long int alkuluvut_max();
unsigned long int alkulkm();
unsigned long int alkuluku(unsigned long int n);
unsigned long int pi(unsigned long int x);

unsigned long int tiedostoon = 0; /* Globaali muuttuja; laskee ohjelman
				     suorituksen aikana tiedostoon lisättyjen
				     alkulukujen lkm:n */
unsigned long int kok_lisays;

int main(int argc, char* argv[])
{
	unsigned long int lisays = strtoul(argv[1], (char**)NULL, 0);	/* Luetaan
				   komentoriviparametri kokonaislukuarvoiseen
				   muuttujaan. */

	kok_lisays = lisays; 	/* Asetetaan globaalin muuttujan kok_lisays
				   arvoksi koko ohjelman suorituksen aikana
				   tiedostoon lisättävien alkulukujen
				   lukumäärä. */
	FILE *fp;
	if(!(fp = fopen("../data/alkuluvut", "r")))	/* Tarkastetaan, onko tiedosto luomatta. */
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
	
	printf("Lisätty %lu alkulukua tiedostoon \"alkuluvut\".\n", tiedostoon);
	printf("Tiedostossa \"alkuluvut\" on yhteensä %lu alkulukua.\n", alkulkm());
	printf("Tiedoston \"alkuluvut\" suurin luku on %lu.\n", alkuluvut_max());

	return 0;
}


void aloitus(unsigned long int lisays)
{
	FILE *fp = fopen("../data/alkuluvut", "wb");
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
	unsigned long int neliojuuri = maaraa_neliojuuri(kandi);
	if(kandi == neliojuuri*neliojuuri)
		kandi += 2;

	
	unsigned long int *p = maaraa_p(neliojuuri, lisays);	/* testaavat alkuluvut */
	
	kandi = maaraa_kandi();						/* Jotta siirrytään oikean luvun */
	neliojuuri = maaraa_neliojuuri(kandi);		/* testaamiseen, kun on pyöritetty */
	if(kandi == neliojuuri*neliojuuri)			/* maaraa_p:n sisällä taydennysta */
		kandi += 2;
	
	unsigned long int p_uudet[lisays];
	
	unsigned long int p_i;
	char alkuluku;
	unsigned long int neliosta = (kandi-neliojuuri*neliojuuri)/2 - 1;	/* indeksi lähtee 0:sta*/
	unsigned long int nelioon = 2*neliojuuri + 1;			/* kandin kasvatusten lkm ennen neliojuuren kasvatusta */
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
			} while(p[p_i] < neliojuuri);
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
		kandi += 2;					/* kandi hyppää neliön yli */
		neliojuuri += 2;			/* neliojuuri kasvaa seuraavaan parittomaan */
		nelioon += 4;
	}
	free(p);
	
	FILE *fp = fopen("../data/alkuluvut", "r+b");
	fseek(fp, 0, SEEK_END);
	fwrite(p_uudet, sizeof(unsigned long int), lisays, fp);
	tiedostoon += lisays;
	fclose(fp);
}

unsigned long int maaraa_kandi()
{
	FILE *fp = fopen("../data/alkuluvut", "rb");
	unsigned long int tmp[1];
	fseek(fp, sizeof(unsigned long int)*(-1), SEEK_END);
	fread(tmp, sizeof(unsigned long int), 1, fp);
	fclose(fp);
	if(tmp[0] == 2)
		tmp[0] = 1;
	return tmp[0] + 2;
}


unsigned long int maaraa_neliojuuri(unsigned long int kandi)
{
	unsigned long int neliojuuri = 0;
	unsigned long int ynna = 1;
	
	while(ynna > 0)
	{
		ynna = 1;
		while((neliojuuri + ynna)*(neliojuuri + ynna) <= kandi)
			ynna *= 2;
		ynna /= 2;
		neliojuuri += ynna;
	}
	
	if(neliojuuri % 2 == 0)
		neliojuuri--;
	
	return neliojuuri;
}

unsigned long int *maaraa_p(unsigned long int neliojuuri, unsigned long int lisays)
{
	unsigned long int i = 0;
	if(lisays > 1)
	{
		while(i < lisays)
		{
			i += 2*(neliojuuri + 1)/lg_2(neliojuuri + 2);	/* approksimoitu varman päälle */
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

	unsigned long int *p = (unsigned long int *) malloc(sizeof(unsigned long int)*nj_maara);
	
	FILE *fp = fopen("../data/alkuluvut", "r");
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

unsigned long int alkuluvut_max()
{
	unsigned long int p[1];
	FILE *fp = fopen("../data/alkuluvut", "r");
	fseek(fp, (sizeof (unsigned long int))*(-1), SEEK_END);
	fread(p, sizeof (unsigned long int), 1, fp);
	fclose(fp);
	return *p;
}

unsigned long int alkulkm()
{
	unsigned long int lkm;
	FILE *fp = fopen("../data/alkuluvut", "r");
	fseek(fp, 0, SEEK_END);
	unsigned long int koko = ftell(fp);
	fclose(fp);
	return (koko/(sizeof (unsigned long int)));
}

unsigned long int alkuluku(unsigned long int n)
{
	unsigned long int p[1];
	FILE *fp = fopen("../data/alkuluvut", "r");
	fseek(fp, (sizeof (unsigned long int))*(n-1), SEEK_SET);
	fread(p, sizeof (unsigned long int), 1, fp);
	fclose(fp);
	return *p;
}

unsigned long int pi(unsigned long int x)
{
	unsigned long int ar = 0;
	unsigned long int yr = alkulkm();
	unsigned long int testi = 1;
	while(yr - ar > 1)
	{
		testi = (ar + yr)/2;
		if(alkuluku(testi) == x)
		{
			return testi;
		}
		else if(alkuluku(testi) < x)
			ar = testi;
		else
			yr = testi;
	}
	return ar;
}
