#define MAX_SYMBOLS 20
#include <stdlib.h>
#include <stdio.h>
union val {
	float fval;
	int ival;
};

struct symitem {
	char *name;
	union val value;
};

struct symtable {
	struct symitem symitems[MAX_SYMBOLS];
	struct symtable *childtable;
	struct symtable *siblingtable;
} symboltable;

int hash(char*);
struct symitem *symlook(char*, int, int);
void printsymbols(FILE*);