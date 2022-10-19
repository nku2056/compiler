#define MAX_SYMBOLS 20
#include <stdlib.h>
#include <stdio.h>
union Type {
	float fval;
	int ival;
	struct symitem* symp;
};

struct symitem {
	char *name;
	union Type value;
};

struct symtable {
	struct symitem symitems[MAX_SYMBOLS];
	struct symtable *childtable;
	struct symtable *siblingtable;
} symboltable;

struct symitem *symlook(char*, int, int);
void printsymbols(FILE*);