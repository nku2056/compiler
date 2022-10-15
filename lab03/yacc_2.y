%{
#include "symtable.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
char idStr[50];
int yylex();
extern int yyparse();
FILE* yyin;
struct symtab symtable[100];
void yyerror(const char* s );
%}

%union {
	double dval;
	struct symtab *symp;
}
%token <symp> NAME
%token <dval> NUMBER
%token ADD
%token SUB
%token MUL
%token DIV
%token EQUAL
%token L_PARE
%token R_PARE

%right EQUAL
%left ADD SUB
%left MUL DIV
%right UMINUS

%type <dval> expression

%%

lines	:	lines statement ';'
		|	lines ';'
		|
		;

statement	:	NAME EQUAL expression	{ $1->value = $3; }
			|	expression	{ printf("%g\n", $1); }
			;

expression	:	expression ADD expression	{ $$ = $1 + $3; }
			|	expression SUB expression	{ $$ = $1 - $3; }
			|	expression MUL expression	{ $$ = $1 * $3; }
			|	expression DIV expression	
							{	if ($3 == 0.0)
									yyerror("divide by zero");
								else
									$$ = $1 / $3;
							}
			|	SUB expression %prec UMINUS	{ $$ = -$2; }
			|	L_PARE expression R_PARE	{ $$ = $2; }
			|	NUMBER	{ $$ = $1; }
			|	NAME	{ $$ = $1->value; }
			;

%%

struct symtab* symlook(char *s) {
	struct symtab *sp;
	for (sp = symtable; sp < &symtable[100]; sp++) {
		if (sp->name && !strcmp(sp->name, s))
			return sp;
		if (!sp->name) {
			sp->name = strdup(s);
			return sp;
		}
	}
	yyerror("TOO MANY SYMBOLS!");
	exit(1);
}

int yylex()
{
	int t ;
	while (1)
	{
		t = getchar ();
		if(t == ' '||t == '\t'||t == '\n')
		{}
		else if(isdigit(t))
		{
			yylval.dval = 0;
			while(isdigit(t)) 
			{
				yylval.dval = yylval.dval * 10 + t - '0';
				t = getchar ();
			}
			ungetc(t,stdin);
			return NUMBER;
		}
		else if((t >= 'a' && t <='z') || (t >= 'A' && t <= 'Z') || (t == '_'))
		{
			int ti = 0;
			while((t >= 'a' && t <='z') || (t >= 'A' && t <= 'Z') || (t == '_') || (t >= '0' && t <= '9'))
			{
				idStr[ti] = t;
				t=getchar();
				ti++;
			}
			idStr[ti] = '\0';
			yylval.symp = symlook(idStr);
			ungetc(t, stdin);
			return NAME;
		}
		else if(t == '+')
		{
			return ADD;
		}
		else if(t == '-')
		{
			return SUB;
		}
		else if(t == '*')
		{
			return MUL;
		}
		else if(t == '/')
		{
			return DIV;
		}
		else if(t == '(')
		{
			return L_PARE;
		}
		else if(t == ')')
		{
			return R_PARE;
		}
		else if(t == '=')
		{
			return EQUAL;
		}
		else
		{
			return t;
		}
	}
}

int main()
{
	yyin = stdin ;
	do 
	{
		yyparse();
	} 
	while (!feof(yyin));
	return 0;
}
void yyerror(const char* s) 
{
	fprintf (stderr, "Parse error : %s\n", s );
	exit (1);
}
