#ifndef ENSEIGNANT__H
#define ENSEIGNANT__H

#include "date.h"

struct enseignant {
	char *nom;
	Date *d_naissance;
};
typedef struct enseignant enseignant;

#endif