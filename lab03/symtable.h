#define MAX_SYMBOLS 20

struct symtab {
	char *name;
	double value;
};

struct  symtab *symlook();
