#ifndef ARIUTILS_H
#define ARIUTILS_H

#define         ENV 	getenv("HOME")
#define        TDST 	"/var/lib/alkuluvut"
#define PATH_LENGTH 	255

unsigned long int neliojuuri(unsigned long int n);

unsigned long int alkuluvut_max();

unsigned long int alkulkm();

unsigned long int ns_alkuluku(unsigned long int n);

unsigned long int pi(unsigned long int n);

unsigned long int *tekijoihinjako(unsigned long int n);

char alkulukuko(unsigned long int n);

unsigned long int seuraava_alkuluku(unsigned long int n);

unsigned long int edellinen_alkuluku(unsigned long int n);

#endif
