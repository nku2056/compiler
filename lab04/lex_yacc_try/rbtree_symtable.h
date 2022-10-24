#include <stdlib.h>
#include <stdio.h>
#include "map.h"

#define symitem map

struct symtable {
	root_t tree;
	struct symtable *childtable;
	struct symtable *siblingtable;
} symboltable;

struct symitem *symlook(char*, int, int);
void printsymbols(FILE*);