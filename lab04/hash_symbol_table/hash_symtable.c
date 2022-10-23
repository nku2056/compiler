#include "hash_symtable.h"

int hash(char* s) {
	unsigned long long value = 0;
	int i = 0;
	while (s[i] != 0) {
		value *= 10;
		value += s[i];
		i++;
	}
	return value % MAX_SYMBOLS;
}

struct symitem* symlook(char *s, int level, int index) {
	struct symtable *tp = &symboltable;
	for (int i = 0; i < level; i++) {
		if (tp->childtable == NULL) {
			tp->childtable = (struct symtable*)malloc(sizeof(struct symtable));
		}
		tp = tp->childtable;
	}
	for (int j = 0; j < index; j++) {
		if (tp->siblingtable == NULL) {
			tp->siblingtable = (struct symtable*)malloc(sizeof(struct symtable));
		}
		tp = tp->siblingtable;
	}
	int p = hash(s);
	struct symitem *sp = tp->symitems + p;
	if (sp->name && !strcmp(sp->name, s))
		return sp;
	if (!sp->name) {
		sp->name = strdup(s);
		return sp;
	}
	int n = 0;
	while (sp->name && strcmp(sp->name, s)) {
		n++;
		if (n == MAX_SYMBOLS) {
			fprintf (stderr, "Hash table full : %s\n", s );
			return NULL;
		}
		sp = tp->symitems + (p + n) % MAX_SYMBOLS;
	}
	sp->name = strdup(s);
	return sp;
}

void recursionprint(FILE* symbols, struct symtable *tp, int level, int index) {
	struct symitem *sp = tp->symitems;
	fprintf(symbols, "The NO.%d Table of level %d\n", index, level);
	fprintf(symbols, "index\taddress\tname\tvalue\n");
	for (int i = 0; i < MAX_SYMBOLS; i++) {
		if (sp[i].name != NULL) {
			fprintf(symbols, "%d\t%x\t%s\n", i, &sp[i], sp[i].name);
		}
	}
	fprintf(symbols, "--------------------------------------\n");
	if (tp->siblingtable != NULL) {
		index++;
		tp = tp->siblingtable;
		recursionprint(symbols, tp, level, index);
	}
	if (tp->childtable != NULL) {
		level++;
		tp = tp->childtable;
		recursionprint(symbols, tp, level, index);;
	}	
}

void printsymbols(FILE* symbols) {
	fprintf(symbols, "This is a simple symbols table\n");
	struct symtable *tp = &symboltable;
	int level = 0;
	int index = 0;
	recursionprint(symbols, tp, level, index);;
}