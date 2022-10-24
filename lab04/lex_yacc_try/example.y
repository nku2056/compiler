%{
	#include "rbtree_symtable.h"
	extern int yyparse();
	FILE* yyin;
	FILE *yyout;
	void yyerror(const char* s );
	extern int linenum;
%}

%union {
	int ival;
	float fval;
	struct val *value;
	struct symitem *symp;
}

%token WHITE
%token EOL
%token <ival> DECIMAL
%token <ival> OCTAL
%token <ival> HEXADECIMAL
%token <fval> FLOATCONST
%token INT
%token FLOAT
%token IF
%token LBRACE
%token RBRACE
%token SEMICOLON
%token LPAREN
%token RPAREN
%token EQ
%token ASSIGN
%token PLUS
%token SUB
%token MULTI
%token DIVIDE
%token LAND
%token LOR
%token LNOT
%token AND
%token OR
%token NOT
%token XOR
%token <symp> ID
%token COMMA
%token RETURN
%token BLOCKCOMMENTBEGIN
%token BLOCKCOMMENTELEMENT
%token BLOCKCOMMENTEND
%token LINECOMMENT

%left ADD SUB
%left MULTI DIVIDE
%right UMINUS

%start compunit
%type <ival> intconst
%type <value> expression

%%

compunit	:	statements	{}
    		;
statements	:	statement	{}
    		|	statements statement	{}
			;

statement	:	ID ASSIGN expression SEMICOLON	{ $1->v = $3; }
			|	INT ID SEMICOLON	{ $2->v->t = INTTYPE; }
			|	FLOAT ID SEMICOLON	{ $2->v->t = FLOATTYPE; }
			|	INT ID ASSIGN expression SEMICOLON	{ $2->v = $4; $2->v->t = INTTYPE; }
			|	FLOAT ID ASSIGN expression SEMICOLON	{ $2->v = $4; $2->v->t = FLOATTYPE; }
			|	expression SEMICOLON	{ printf("%d\t%d\t%f\n", $1->t, $1->ival, $1->fval); }
			|   funcdef	{}
			|	RETURN expression SEMICOLON	{}
			|	RETURN SEMICOLON	{}
			;

blockstmt	: LBRACE statements RBRACE	{}
   			;

funcdef	:	INT ID LPAREN funcfparams RPAREN blockstmt{ $2->v->t = INTTYPE; }
		|	FLOAT ID LPAREN funcfparams RPAREN blockstmt{ $2->v->t = INTTYPE; }
		|	INT ID LPAREN RPAREN blockstmt{ $2->v->t = INTTYPE; }
		|	FLOAT ID LPAREN RPAREN blockstmt{ $2->v->t = FLOATTYPE; }
    	;

funcfparams	:	funcfparams COMMA funcfparam	{}
    		| 	funcfparam	{}
    		;

funcfparam	:	INT ID	{ $2->v->t = INTTYPE; }
			|	FLOAT ID	{ $2->v->t = FLOATTYPE; }
			;

expression	:	expression ADD expression	{ $$ = (struct val*)malloc(sizeof(struct val)); val_add($$, $1, $3); }
			|	expression SUB expression	{ $$ = (struct val*)malloc(sizeof(struct val)); val_sub($$, $1, $3); }
			|	expression MULTI expression	{ $$ = (struct val*)malloc(sizeof(struct val)); val_multi($$, $1, $3); }
			|	expression DIVIDE expression	{
					if ($3->t == INTTYPE && $3->ival == 0) {
						yyerror("divide by zero");	
					} 
					if ($3->t == FLOATTYPE && $3->fval == 0.0) {
						yyerror("divide by zero");	
					}
					$$ = (struct val*)malloc(sizeof(struct val));
					val_divide($$, $1, $3); 
				}	
			|	SUB expression %prec UMINUS	{ $$ = (struct val*)malloc(sizeof(struct val)); $$->ival = -$2->ival; $$->fval = -$2->fval; $$->t = $2->t;}
			|	LPAREN expression RPAREN	{ $$ = $2; }
			|	intconst	{ $$ = (struct val*)malloc(sizeof(struct val)); $$->ival = $1; $$->t = INTTYPE; }
			|	FLOATCONST	{ $$ = (struct val*)malloc(sizeof(struct val)); $$->fval = $1; $$->t = FLOATTYPE; }
			|	ID	{ $$ = (struct val*)malloc(sizeof(struct val)); $$->ival = $1->v->ival; $$->fval = $1->v->fval; $$->t = $1->v->t; }
			;

intconst	:	DECIMAL	{ $$ = $1; }
			|	OCTAL	{ $$ = $1; }
			|	HEXADECIMAL	{ $$ = $1; }
			;

%%

void yyerror(const char* s) 
{
	fprintf (stderr, "Line %d Parse error : %s\n", linenum, s);
	exit (1);
}

int main(int argc, char* argv[])
{
	
	yyin = fopen(argv[1], "r");
	yyout = fopen(argv[2], "w");
	do 
	{
		yyparse();
	} 
	while (!feof(yyin));
	return 0;
}