#include "rbtree_symtable.h"

struct symitem* symlook(char *s, int level, int index) {
	printf("%s\n", s);
	struct symitem *sp;
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
	sp = get(&tp->tree, s);
	if (sp == NULL) {
		sp = pre_put(&tp->tree, s);
	}
	return sp;
}

void recursionprint(FILE* symbols, struct symtable* tp, int level, int index) {
	struct symitem *sp = map_first(&tp->tree);
	fprintf(symbols, "The NO.%d Table of level %d\n", index, level);
	fprintf(symbols, "index\taddress\tname\ttype\tvalue\n");
	int i = 0;
	while(sp != NULL) {
		if (sp->v->t == INTTYPE) {
			
		}
		fprintf(symbols, "%d\t%x\t%s\n", i, sp, sp->key);
		sp = map_next(&sp->node);
		i++;
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