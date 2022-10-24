#include "map.h"

map_t *get(root_t *root, char *str) {
   rb_node_t *node = root->rb_node; 
   while (node) {
        map_t *data = container_of(node, map_t, node);

        int cmp = strcmp(str, data->key);
        if (cmp < 0) {
            node = node->rb_left;
        }else if (cmp > 0) {
            node = node->rb_right;
        }else {
            return data;
        }
   }
   return NULL;
}

map_t *pre_put(root_t *root, char* key) {
    map_t *data = (map_t*)malloc(sizeof(map_t));
    data->key = (char*)malloc((strlen(key)+1)*sizeof(char));
    strcpy(data->key, key);
    data->v = (struct val*)malloc(sizeof(struct val));
    
    rb_node_t **new_node = &(root->rb_node), *parent = NULL;
    while (*new_node) {
        map_t *this_node = container_of(*new_node, map_t, node);
        int result = strcmp(key, this_node->key);
        parent = *new_node;

        if (result < 0) {
            new_node = &((*new_node)->rb_left);
        }else if (result > 0) {
            new_node = &((*new_node)->rb_right);
        }else {
            free(data);
            return this_node;
        }
    }

    rb_link_node(&data->node, parent, new_node);
    rb_insert_color(&data->node, root);

    return data;
}

int put(root_t *root, char* key, struct val* val) {
    map_t *data = (map_t*)malloc(sizeof(map_t));
    data->key = (char*)malloc((strlen(key)+1)*sizeof(char));
    strcpy(data->key, key);
    data->v = (struct val*)malloc(sizeof(struct val));
    memmove(data->v, val, sizeof(struct val));
    
    rb_node_t **new_node = &(root->rb_node), *parent = NULL;
    while (*new_node) {
        map_t *this_node = container_of(*new_node, map_t, node);
        int result = strcmp(key, this_node->key);
        parent = *new_node;

        if (result < 0) {
            new_node = &((*new_node)->rb_left);
        }else if (result > 0) {
            new_node = &((*new_node)->rb_right);
        }else {
            memmove(this_node->v, val, sizeof(struct val));
            free(data);
            return 0;
        }
    }

    rb_link_node(&data->node, parent, new_node);
    rb_insert_color(&data->node, root);

    return 1;
}

map_t *map_first(root_t *tree) {
    rb_node_t *node = rb_first(tree);
    return (rb_entry(node, map_t, node));
}

map_t *map_next(rb_node_t *node) {
    rb_node_t *next =  rb_next(node);
    return rb_entry(next, map_t, node);
}

void map_free(map_t *node){
    if (node != NULL) {
        if (node->key != NULL) {
            free(node->key);
            node->key = NULL;
    }
        free(node);
        node = NULL;
    }
}

void val_add(struct val *a, struct val *b, struct val *c) {
    if (b->t == FLOATTYPE && c->t == INTTYPE) {
        a->t = FLOATTYPE;
        a->fval = b->fval + c->ival;
        return;
    }
    else if (b->t == INTTYPE && c->t == FLOATTYPE) {
        a->t = FLOATTYPE;
        a->fval = b->ival + c->fval;
        return;
    }
    else if (b->t == FLOATTYPE && c->t == FLOATTYPE) {
        a->t = FLOATTYPE;
        a->fval = b->fval + c->fval;
        return;
    }
    else if (b->t == INTTYPE && c->t == INTTYPE) {
        a->t = INTTYPE;
        a->ival = b->ival + c->ival;
        return;
    }
    else {
        /*
        */
        return;
    }
}
void val_sub(struct val *a, struct val *b, struct val *c) {
        if (b->t == FLOATTYPE && c->t == INTTYPE) {
        a->t = FLOATTYPE;
        a->fval = b->fval - c->ival;
        return;
    }
    else if (b->t == INTTYPE && c->t == FLOATTYPE) {
        a->t = FLOATTYPE;
        a->fval = b->ival - c->fval;
        return;
    }
    else if (b->t == FLOATTYPE && c->t == FLOATTYPE) {
        a->t = FLOATTYPE;
        a->fval = b->fval - c->fval;
        return;
    }
    else if (b->t == INTTYPE && c->t == INTTYPE) {
        a->t = INTTYPE;
        a->ival = b->ival - c->ival;
        return;
    }
    else {
        /*
        */
        return;
    }
}
void val_multi(struct val *a, struct val *b, struct val *c) {
        if (b->t == FLOATTYPE && c->t == INTTYPE) {
        a->t = FLOATTYPE;
        a->fval = b->fval * c->ival;
        return;
    }
    else if (b->t == INTTYPE && c->t == FLOATTYPE) {
        a->t = FLOATTYPE;
        a->fval = b->ival * c->fval;
        return;
    }
    else if (b->t == FLOATTYPE && c->t == FLOATTYPE) {
        a->t = FLOATTYPE;
        a->fval = b->fval * c->fval;
        return;
    }
    else if (b->t == INTTYPE && c->t == INTTYPE) {
        a->t = INTTYPE;
        a->ival = b->ival * c->ival;
        return;
    }
    else {
        /*
        */
        return;
    }
}
void val_divide(struct val *a, struct val *b, struct val *c) {
    if (c->t == INTTYPE && c->ival == 0) {
        printf("DIVIDE ZERO!\n");
        return;
    }
    if (c->t == FLOATTYPE && c->fval == 0.0) {
        printf("DIVIDE ZERO!\n");
        return;
    }
    if (b->t == FLOATTYPE && c->t == INTTYPE) {
        a->t = FLOATTYPE;
        a->fval = b->fval / c->ival;
        return;
    }
    else if (b->t == INTTYPE && c->t == FLOATTYPE) {
        a->t = FLOATTYPE;
        a->fval = b->ival / c->fval;
        return;
    }
    else if (b->t == FLOATTYPE && c->t == FLOATTYPE) {
        a->t = FLOATTYPE;
        a->fval = b->fval / c->fval;
        return;
    }
    else if (b->t == INTTYPE && c->t == INTTYPE) {
        a->t = INTTYPE;
        a->ival = b->ival / c->ival;
        return;
    }
    else {
        /*
        */
        return;
    }
}