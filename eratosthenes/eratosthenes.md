###Vanha kunnon Eratosthenes

_Eratostheneen seula on oikeastaan fyysisillä
muistiinpanovälineillä toteutettava menetelmä. Niinpä ohjelmoitaessa tietokone
käyttämään sitä alkulukutaulun tuottamiseksi on päätettävä, mitä tietokoneen
ylipäätään halutaan tekevän. Tässä toteutuksessa alkulukuehdokkaista seulotaan
yksitellen alkuluvut. Näin alkulukutaulun täydentäminen on joustavampaa kuin
seulottaessa ennalta määrätystä lukualueesta yksitellen eri alkulukumonikerrat
pois. Laskentakapasiteettia tarvitaan molemmissa tavoissa suurin piirtein
saman verran, mutta nyt toteutettava tapa pärjää huomattavsti vähäisemmällä
muistin määrällä._

Eratostheneen seulan ohjelmoiminen on "aina hauskaa ajanvietettä". Lisäksi
sen avulla on helppo demonstroida, kuinka rajallinen jokaisen tietokoneen
laskentateho on ja kuinka hyödyllistä algoritmien suunnittelu on.

Luonnollisen luvun jaottomuus voidaan selvittää testaamalla sen jaollisuus
neliöjuurtaan pienemmillä alkuluvuilla; tarpeen vaatiessa neliöjuuri mukaan
lukien. On siis tunnettava joukko, jonka osajoukon nämä alkuluvut muodostavat,
ja käytävä läpi tämän joukon alkiot. Ilmeinen mahdollisuus on valita joukoksi
luonnolliset luvut kahdesta eteen päin, kunnes luvun neliö ylittää testattavan
luvun arvon. Näin kuitenkin haaskataan laskentakapasiteettia, koska joudutaan
tekemään monta turhaa jaollisuustestausta. Otetaan siis käyttöön muistia, jonne
kirjoitetaan löydetyt alkuluvut suuruusjärjestyksessä -- ja kas: saadaan
itsensä täydentämiseen kykenevä alkulukutesti.

Kuten tunnettua, tämä ajatus ei ole uusi, eikä laskentakapasiteetin suinkaan
tarvitse olla koneellista eikä muistinkaan omaamme kummempaa. Esimerkiksi lukua
121 pienemmän luvun jaottomuuden selvittäminen vaatii vain lukujen 2, 3, 5 ja 7
läpi käymistä, ja meille kymmenjärjestelmään tottuneille 2:lla ja 5:llä
jaollisuuden testaaminen on triviaalia, 3:n jaollisuussääntö opitaan
alaluokilla ja 7:n monikertoja ei enää montaa jää. Joidenkin mummojen tuntemaa
7:n jaollisuussääntöä ei edes varsinaisesti tarvita. Miljoonaa pienempien
lukujen testaaminen käy vielä kynällä ja paperilla (tai kepillä ja hiekalla),
mutta lukujen kasvaessa seinä nousee pystyyn.

####Ohjelmoimaan

Toteutetaan ohjelma C-kielellä ja pyritään pitäytymään ns. ANSI-C:ssä, jotta
lähdekoodi kääntyy käytännössä kaikilla alustoilla, joille on toteutettu jokin
C-kääntäjä.

Ensimmäinen vaihtoehto on toteuttaa ohjelma niin, että se joutuu lähtemään
alusta jokaisella suorituskerralla. Tällöin alkuluvut kirjoitetaan yksiulotteiseen
taulukkoon, jonka koko voidaan antaa esimerkiksi komentoriviparametrina. Toisessa
vaihtoehdossa ohjelma kirjoittaa laskemansa alkuluvut jossain vaiheessa
tiedostoon, joka säilyy seuraavia suorituskertoja varten. Tällöin tiedostoa
voidaan kasvattaa kumulatiivisesti, ja saadaan muodostettua peräti laaja
alkulukutietokanta.

Toteutetaan toinen vaihtoehto. Valitaan ohjelman nimeksi
`eratos` ja käytetään syötteiden
antamiseen vain komentoriviparametreja. Ensimmäinen parametri kertoo, mitä
ohjelman toiminnallisuutta käytetään. Näitä toiminnallisuuksia voivat olla
esimerkiksi

<dl>
	<dt>kasvata</dt>
	<dd>Laskee alkulukutiedostoon lisää alkulukuja</dd>
	<dt>testaa</dt>
	<dd>Testaa, onko annettu luku alkuluku</dd>
	<dt>pi</dt>
	<dd>Kertoo annettua lukua pienempien tai yhtäsuurten alkulujen lukumäärän (alkulukufunktio)</dd>
	<dt>invpi</dt>
	<dd>Kertoo n:nnen alkuluvun (edellisen käänteisfunktio)</dd>
	<dt>suurin</dt>
	<dd>Kertoo suurimman anettua lukua pienemmän tai yhtäsuuren alkuluvun</dd>
	<dt>pienin</dt>
	<dd>Kertoo pienimmän annettua lukua suuremman tai yhtäsuuren alkuluvun</dd>
</dl>

Toinen parametri syötetään ilmeisenä kokonaislukuargumenttina sopivalle
funktiolle. Olkoon alkulukutiedosto binäärimuotoinen ja nimeltään
`alkuluvut`. Tekstimuotoinen tiedosto
kuluttaisi binäärimuotoista rutkasti enemmän tallennustilaa ja olisi sitä
paitsi vaikeampi käsitellä.

Luetelluista esimerkkitoiminnallisuuksista neljä viimeistä on pelkkää
tiedoston lukemista ja toinen on oleellisesti ensimmäisen osatehtävä.
Keskitytään näin ollen ensimmäiseen toimintoon. Se onkin varsinainen
Eratostheneen seula, jossa yhdistetyt luvut popsitaan pois ja jätetään
unholaan.

####Toteutus

Käytetään
`unsigned long int` -tyyppiä lukujen
käsittelyyn. Tämän tyypin koko on toteustusriippuvainen ja selviää
`<limits.h>`-otsikkotiedoston
`ULONG_MAX`-vakiosta. Tietoa
koosta tarvitaan lähinnä käsiteltäessä luotua alkulukutiedostoa toisella
alustalla, ja 4-tavuisen toteutuksen kohdalla voidaan myös päätyä
käsiteltävien lukujen koon ylärajalle.

Lähtökohta ohjelman suorituksessa on avata
`alkuluvut`-tiedosto ja lukea sieltä
tarvittavat tiedot taulukoihin. Kun ohjelma suoritetaan ensimmäistä kertaa,
tiedostoa ei ole vielä luotu ja ensimmäisten arvojen syöttäminen on tehtävä
käsin. Jos tiedostossa on jo riittävästi alkulukuja, jatketaan seuraavien
alkulukujen laskemista.

#####Alkuvalmistelut

Jos `alkuluvut`-tiedostoa ei ole
olemassa, käsky `fopen("alkuluvut", "r")`
palauttaa arvon `NULL` muuten
tiedosto-osoittimen arvon. Toteutetaan seuraavanlainen valinta, jotta ohjelma
osaa päättää, miten edetään:
<pre>
FILE *fp;
if(!(fp = fopen("alkuluvut", "r"))
	i. lähdetään liikkeelle tyhjästä
else
	ii. työstetään olemassa olevaa tiedostoa
</pre>
Tapauksessa ii. tarkastetaan aluksi, onko tiedostossa jo alkulukuja
täydennysalgoritmia varten (yksi riittää). Jos ei ole, kirjoitetaan olemassa
olevan `alkuluvut`-tiedoston
päälle ja toimitaan kuten tapauksessa i. Muuten siirrytään tiedoston
täydentämiseen, ja `else`-lohkosta
tulee jotain seuraavankaltaista.
<pre>
else
{
	unsigned long int lkm;
	fseek(fp, 0, SEEK_END);
	lkm = ftell(fp) / (sizeof(unsigned long int));
	fclose(fp);
	if(lkm == 0)
		lähdetään liikkeelle tyhjästä
	else
		täydennetään tiedostoa
}
</pre>

#####Alkulukujen seulominen

Olkoon muuttujan
`unsigned long int kandi` arvona luku,
josta halutaan selvittää onko tämä alkuluku, ja sisältäköön taulukko
`unsigned long int p[]` pienimmät
alkuluvut suuruusjärjestyksessä vähintään luvun
`kandi` neliöjuuren kokonaisosaan
asti. Tällöin `kandi`n
alkulukuisuus saadaan selvitettyä esimerkiksi seuraavalla idealla.
<pre>
unsigned long int p_i = -1;	/* indeksi; int riittäisi */
char alkuluku = 1;		/* "totuusarvo" */
do
{
	p_i++;
	if(kandi % p[p_i] == 0)
	{
		alkuluku = 0;	/* ei ole alkuluku */
		break;
	}
} while(p[pi] &lt; neliojuuri)
if(alkuluku)
	jee!
</pre>
Tässä käytetään
`do -- while` -silmukkaa, koska
`while`-silmukan ehdon tarkastuksessa
voitaisiin joutua taulukon `p`
ulkopuolelle.


Seuraavaksi on selvitettävä, miten muuttujan
`kandi` arvo kannattaa valita, miten
`neliojuuri` määrätään ja kuinka iso
taulukon `p` pitää olla. Koska
parillisia lukuja on turha testata, muuttujan
`kandi` arvoa kannattaa kasvattaa
kerralla kahdella. Näin mahdollistuu myös sellainen pienen pieni hienosäätö,
että indeksi `p_i` voi aloittaa
taulukon `p` läpikäymisen arvosta 1.
Lisäpuuhastelua saisi jättämällä myös kolmosen monikerrat pois. Tällöin
`kandi` kasvaisi vuorotellen kahdella
ja neljällä.

#####Neliöjuuren säätöä

Muuttujan `neliojuuri` sisällön
määrääminen on nyt toteutettavan
`eratos`-ohjelman hauskin osa. Kun
ohjelma alkaa täydentää alkulukutiedostoa, muuttujan
`kandi` arvoksi valitaan tiedoston
suurin luku lisättynä kahdella. Muuttujan
`neliojuuri` arvoksi voitaisi
asettaa tämän neliöjuuren kokonaisosa. Koska muuttujan
`neliojuuri` neliöstä seuraavaan
neliöön on `2*neliojuuri + 1` ja
`kandi` kasvaa aina kerralla
kahdella, päästään tilanteeseen, jossa muuttujan
`neliojuuri` kasvutarve saadaan
määrättyä muuttujan `kandi`
arvonmuutosten lukumäärän perusteella. Tämän lukumäärän kirjanpitoa varten
tarvitaan uusi muuttuja, mutta ennen sen määräämistä hiotaan vielä
muuttujan `neliojuuri` määräämistä.

Koska parittomalla luvulla ei voi olla parillista alkutekijää, muuttujan
`neliojuuri` arvoa on tarpeen
kasvattaa vasta muuttujan `kandi`
arvon saavutettua seuraavan parittoman neliön. Koska neliöitä on turha testata,
muuttujan `kandi` arvoa voidaan
kasvattaa neljällä aina, kun tulee aika kasvattaa muuttujan
`neliojuuri` arvoa. Näin ollen
muuttujan `neliojuuri` arvoksi
määräytyy muuttujan `kandi`
neliöjuurta edeltävä pariton luku. Jos ohjelman suorituksen alussa ensmmäinen
muuttujan `kandi` arvo osoittautuu
neliöksi, siirrytään seuraavaan parittomaan arvoon ja jatkossa ohjelma hyppää
automaattisesti neliöiden yli.

Kahden peräkkäisen parittoman neliön k^2 ja (k+2)^2 erotus on 4k+4. Täten
näiden välillä on 2k+1 paritonta epäneliötä, jotka ovat mahdollisia alkulukuja.
Muuttujan `neliojuuri` arvon
kasvattamisesta huolehtiva koodi voi siis olla vaikka seuraavankaltainen.
<pre>
unsigned long int p_i;
char alkuluku;
unsigned long int neliosta = (kandi-neliojuuri*neliojuuri)/2 - 1;	/* indeksi
				lähtee nollasta */
unsigned long int nelioon = 2*neliojuuri + 1;			/* kandin kasvatusten
				lkm ennen neliojuuren kasvatusta */

while(ollaan laskettu riittävästi)
{
	while(neliosta &lt; nelioon)
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
		} while(p[pi] &lt; neliojuuri)
		if(alkuluku)
		{
			lisätään tauluun
			break;
		}
		kandi += 2;
		neliosta++;
	}
	neliosta = 0;
	kandi += 2;		/* hypätään neliön yli */
	neliojuuri += 2;	/* seuraavaan parittomaan */
	nelioon += 4;
}
</pre>

Muuttujan `neliojuuri` alustaminen
ennen alkulukujen seulomista toteutetaan seuraavalla algoritmilla, joka määrää
annetun luvun neliöjuuren kokonaisosan binääriesityksen bitti kerrallaan ja
vähentää mahdollisesti saadusta parillisesta luvusta yhden.
<pre>
unsigned long int maaraa_neliojuuri(unsigned long int kandi)
{
	unsigned long int neliojuuri = 0;
	unsigned long int ynna = 1;
	
	while(ynna &gt; 0)
	{
		ynna = 1;
		while((neliojuuri + ynna)*(neliojuuri + ynna) &gt;= kandi)
			ynna *= 2;
		ynna /= 2;
		neliojuuri += ynna;
	}
	
	if(neliojuuri % 2 == 0)
		neliojuuri--;
	
	return neliojuuri;
}
</pre>

#####Testaavien alkulukujen valitseminen

Määrättäessä testaavat alkuluvut sisältävän taulukon
`p` kokoa on otettava huomioon kaksi
seikkaa: Kuinka suuri enintään on suurin lisättävä alkuluku? Miten toimitaan,
jos `alkuluvut`-tiedostossa ei ole
riittävästi alkulukuja? Ensimmäisen kysymyksen kohdalla käytetään hyväksi
alkulukulausetta ja approksimoidaan varman päälle. Toisessa tapauksessa
toimitaan rekursiivisesti ja kutsutaan alkulukuja täydentävää aliohjelmaa
ensin riittävän pienellä lisäyksellä.

Alkulukulauseen mukaan alkulukujen välinen etäisyys on keskimäärin
likimäärin ln(x), kun x on tarkasteltavien lukujen suuruus. Jos lisättävien
alkulukujen määrä on nyt `lisays`,
saadaan arvio
<pre>
&pi;((k + 2)^2) - &pi;(k^2) &lt; 4*(`neliojuuri` + 1) / lg((`neliojuuri` + 2)^2)<br>
					= 2*(`neliojuuri` + 1) / lg(`neliojuuri` + 2),
</pre>
missä &pi; on alkulukufunktio ja lg 2-kantainen logaritmi, sillä parittomien
neliöiden välissä olevien lukujen määrä on (k + 2)^2 - k^2 = 4(k + 1).

Taulukon `p` määräävä aliohjelma
toteutetaan nyt seuraavasti.
<pre>
unsigned long int *maaraa_p(unsigned long int neliojuuri, unsigned long int lisays)
{
	unsigned long int i = 0;
	if(lisays &gt; 1)
	{
		while(i &lt; lisays)
		{
			i += 2*(neliojuuri + 1)/lg_2(neliojuuri + 2);
			neliojuuri += 2;
		}
	}


	while(neliojuuri &gt; alkuluvut_max())
	{
		unsigned long int uusi_lisays = alkulkm();
		if(uusi_lisays &gt; kok_lisays - tiedostoon)
			uusi_lisays = kok_lisays - tiedostoon;
		taydennys(uusi_lisays);
	}
	
	unsigned long int nj_maara = pi(neliojuuri) + 1;

	unsigned long int *p = (unsigned long int *)
				malloc(sizeof(unsigned long int)*nj_maara);
	
	FILE *fp = fopen("alkuluvut", "r");
	fseek(fp, 0, SEEK_SET);
	fread(p, sizeof(unsigned long int), nj_maara, fp);
	fclose(fp);

	return p;
}
</pre>
Koska aliohjelma palauttaa osoittimen allokoituun muistialueeseen, tämä on
muistettava tyhjentää, kun taulukkoa
`p` ei enää tarvita. Aliohjelmassa
kutsutaan edelleen aliohjelmia
`alkuluvut_max`,
`alkulkm` ja
`pi`. Näistä
`pi` on tuttu ja kaksi muuta
palauttavat ilmeistä tietoa tiedoston
`alkuluvut` sisällöstä. Näiden
toteutukset kuten myös muuttujien
`kok_lisays` ja
`tiedostoon` merkitykset selviävät
alla olevasta ohjelmakoodista.

####Palaset yhteen

Seuraavassa on esillä ohjelman koko koodi, kun ainoana toiminnallisuutena on
tiedoston `alkuluvut`
täydentäminen.

<pre>
#include &lt;stdio.h&gt;
#include &lt;stdlib.h&gt;

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
	if(!(fp = fopen("alkuluvut", "r")))	/* Tarkastetaan, onko tiedosto
				   luomatta. */
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
	FILE *fp = fopen("alkuluvut", "wb");
	if(lisays &gt; 0)
	{
		unsigned long int *p;
		p[0] = 2;
		fwrite(p, sizeof(unsigned long int), 1, fp);
		tiedostoon++;
	}
	fclose(fp);
	
	unsigned long int uusi_lisays = lisays - 1;
	if(uusi_lisays &lt; 0)
		uusi_lisays = 0;
	taydennys(uusi_lisays);
}


void taydennys(unsigned long int lisays)
{
	if(lisays &lt; 1) return;

	unsigned long int kandi = maaraa_kandi();
	unsigned long int neliojuuri = maaraa_neliojuuri(kandi);
	if(kandi == neliojuuri*neliojuuri)
		kandi += 2;

	
	unsigned long int *p = maaraa_p(neliojuuri, lisays); /* testaavat alkuluvut */
	
	kandi = maaraa_kandi();			/* Jotta siirrytään oikean luvun */
	neliojuuri = maaraa_neliojuuri(kandi);	/* testaamiseen, kun on pyöritetty */
	if(kandi == neliojuuri*neliojuuri)	/* maaraa_p:n sisällä taydennysta */
		kandi += 2;
	
	unsigned long int p_uudet[lisays];
	
	unsigned long int p_i;
	char alkuluku;
	unsigned long int neliosta = (kandi-neliojuuri*neliojuuri)/2 - 1; /* indeksi
				lähtee 0:sta */
	unsigned long int nelioon = 2*neliojuuri + 1;	/* kandin kasvatusten lkm ennen 
				neliojuuren kasvatusta */
	unsigned long int lisatty = 0;
	
	if(lisays > kok_lisays - tiedostoon)
		lisays = kok_lisays - tiedostoon;
	
	char riittaa = (lisatty == lisays);
	
	while(!riittaa)
	{
		while(neliosta &lt; nelioon)
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
			} while(p[p_i] &lt; neliojuuri);
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
		neliojuuri += 2;	/* neliojuuri kasvaa seuraavaan parittomaan */
		nelioon += 4;
	}
	free(p);
	
	FILE *fp = fopen("alkuluvut", "r+b");
	fseek(fp, 0, SEEK_END);
	fwrite(p_uudet, sizeof(unsigned long int), lisays, fp);
	tiedostoon += lisays;
	fclose(fp);
}

unsigned long int maaraa_kandi()
{
	FILE *fp = fopen("alkuluvut", "rb");
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
	
	while(ynna &gt; 0)
	{
		ynna = 1;
		while((neliojuuri + ynna)*(neliojuuri + ynna) &lt;= kandi)
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
	if(lisays &gt; 1)
	{
		while(i &lt; lisays)
		{
			i += 2*(neliojuuri + 1)/lg_2(neliojuuri + 2); /* approksimoitu
				varman päälle */
			neliojuuri += 2;
		}
	}


	while(neliojuuri &gt; alkuluvut_max())
	{
		unsigned long int uusi_lisays = alkulkm();
		if(uusi_lisays &gt; kok_lisays - tiedostoon)
			uusi_lisays = kok_lisays - tiedostoon;
		taydennys(uusi_lisays);
	}
	
	unsigned long int nj_maara = pi(neliojuuri) + 1;

	unsigned long int *p = (unsigned long int *)
				malloc(sizeof(unsigned long int)*nj_maara);
	
	FILE *fp = fopen("alkuluvut", "r");
	fseek(fp, 0, SEEK_SET);
	fread(p, sizeof(unsigned long int), nj_maara, fp);
	fclose(fp);

	return p;
}

int lg_2 (unsigned long int n)
{
	int i = 0;
	while(n &gt; 1)
	{
		n /= 2;
		i++;
	}
	return i;
}

unsigned long int alkuluvut_max()
{
	unsigned long int p[1];
	FILE *fp = fopen("alkuluvut", "r");
	fseek(fp, (sizeof (unsigned long int))*(-1), SEEK_END);
	fread(p, sizeof (unsigned long int), 1, fp);
	fclose(fp);
	return *p;
}

unsigned long int alkulkm()
{
	unsigned long int lkm;
	FILE *fp = fopen("alkuluvut", "r");
	fseek(fp, 0, SEEK_END);
	unsigned long int koko = ftell(fp);
	fclose(fp);
	return (koko/(sizeof (unsigned long int)));
}

unsigned long int alkuluku(unsigned long int n)
{
	unsigned long int p[1];
	FILE *fp = fopen("alkuluvut", "r");
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
	while(yr - ar &gt; 1)
	{
		testi = (ar + yr)/2;
		if(alkuluku(testi) == x)
		{
			return testi;
		}
		else if(alkuluku(testi) &lt; x)
			ar = testi;
		else
			yr = testi;
	}
	return ar;
}
</pre>
