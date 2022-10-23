#include "rbtree.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

union val {
	float fval;
	int ival;
};

struct map {
    struct rb_node node;
    char *key;
    union val v;
};

typedef struct map map_t;
typedef struct rb_root root_t;
typedef struct rb_node rb_node_t;

map_t *get(root_t *root, char *str);
int put(root_t *root, char* key, union val val);
map_t *map_first(root_t *tree);
map_t *map_next(rb_node_t *node);
void map_free(map_t *node);