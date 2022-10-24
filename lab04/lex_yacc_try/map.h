#include "rbtree.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

enum valtype {
    INTTYPE, FLOATTYPE
};

struct val {
    enum valtype t;
    int ival;
	float fval;
};

struct map {
    struct rb_node node;
    char *key;
    struct val* v;
};

typedef struct map map_t;
typedef struct rb_root root_t;
typedef struct rb_node rb_node_t;

map_t *get(root_t*, char*);
map_t *pre_put(root_t*, char*);
int put(root_t*, char*, struct val*);
map_t *map_first(root_t*);
map_t *map_next(rb_node_t*);
void map_free(map_t*);

void val_add(struct val *a, struct val *b, struct val *c);
void val_sub(struct val *a, struct val *b, struct val *c);
void val_multi(struct val *a, struct val *b, struct val *c);
void val_divide(struct val *a, struct val *b, struct val *c);