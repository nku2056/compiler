%option noyywrap
%{
#include "hash_symtable.h"
#include <stdio.h>

union Type {
	int ival;
	float fval;
	struct symitem* symp;
};
extern FILE *yyin; 
extern FILE *yyout;
union Type value;
int current_level = 0;
int current_index = 0;
int old_index = 0;
%}

WHITE	[ \t]
EOL	(\r\n|\n|\r)
DECIMAL	0|[1-9][0-9]*
OCTAL	0[0-7]+
HEXADECIMAL	(0x|0X)[0-9A-Fa-f]+
FLOATCONST	([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?
INT int
FLOAT float
IF	if
LBRACE	\{
RBRACE	\}
SEMICOLON	;
LPAREN	\(
RPAREN	\)
EQ	==
ASSIGN	=
PLUS	\+
SUB	-
MULTI	\*
DIVIDE	\/
LAND	&&
LOR	\|\|
LNOT	!
AND	&
OR	\|
NOT	~
XOR	\^
ID	[A-Za-z_][0-9A-Za-z_]*
BLOCKCOMMENTBEGIN \/\*
BLOCKCOMMENTELEMENT .
BLOCKCOMMENTEND \*\/
%x BLOCKCOMMENT
LINECOMMENT \/\/[^\n]*

%%

{DECIMAL}	{value.ival = atoi(yytext);fprintf(yyout, "DECIMAL\t\t%s\t\t%d\n", yytext, value.ival);}
{OCTAL}	{sscanf(yytext, "%o", &value.ival);fprintf(yyout, "OCTAL\t\t%s\t\t%d\n", yytext, value.ival);}
{HEXADECIMAL}	{sscanf(yytext, "%x", &value.ival);fprintf(yyout, "HEXADECIMAL\t\t%s\t\t%d\n", yytext, value.ival);}
{FLOATCONST}	{value.fval = atof(yytext);fprintf(yyout, "DOUBLE\t\t%s\t\t%f\n", yytext, value.fval);}
{INT}	{fprintf(yyout, "INT\t\t%s\n", yytext);}
{FLOAT}	{fprintf(yyout, "FLOAT\t\t%s\n", yytext);}
{IF}	{fprintf(yyout, "IF\t\t%s\n", yytext);}
{LBRACE}	{current_level++;old_index = current_index;current_index = 0;fprintf(yyout, "LBRACE\t\t%s\n", yytext);}
{RBRACE}	{current_level--;current_index++;current_index = old_index;fprintf(yyout, "RBRACE\t\t%s\n", yytext);}
{SEMICOLON}	{fprintf(yyout, "SEMICOLON\t\t%s\n", yytext);}
{LPAREN}	{fprintf(yyout, "LBRACE\t\t%s\n", yytext);}
{RPAREN}	{fprintf(yyout, "RBRACE\t\t%s\n", yytext);}
{EQ}	{fprintf(yyout, "EQ\t\t%s\n", yytext);}
{ASSIGN}	{fprintf(yyout, "ASSIGN\t\t%s\n", yytext);}
{PLUS}	{fprintf(yyout, "PLUS\t\t%s\n", yytext);}
{SUB}	{fprintf(yyout, "SUB\t\t%s\n", yytext);}
{MULTI}	{fprintf(yyout, "MULTI\t\t%s\n", yytext);}
{DIVIDE}	{fprintf(yyout, "DIVIDE\t\t%s\n", yytext);}
{LAND}	{fprintf(yyout, "LAND\t\t%s\n", yytext);}
{LOR}	{fprintf(yyout, "LOR\t\t%s\n", yytext);}
{LNOT}	{fprintf(yyout, "LNOT\t\t%s\n", yytext);}
{AND}	{fprintf(yyout, "AND\t\t%s\n", yytext);}
{OR}	{fprintf(yyout, "OR\t\t%s\n", yytext);}
{NOT}	{fprintf(yyout, "NOT\t\t%s\n", yytext);}
{XOR}	{fprintf(yyout, "XOR\t\t%s\n", yytext);}
{ID}	{value.symp = symlook(yytext, current_level, current_index);fprintf(yyout, "ID\t\t%s\t\t%X\n", yytext, value.symp);}
{EOL}	;
{WHITE}	;
{LINECOMMENT} {}
{BLOCKCOMMENTBEGIN} {BEGIN BLOCKCOMMENT;}
<BLOCKCOMMENT>{BLOCKCOMMENTELEMENT} {}
<BLOCKCOMMENT>{BLOCKCOMMENTEND} {BEGIN INITIAL;}


%%

int main(int argc, char* argv[])
{
	
	yyin = fopen(argv[1], "r");
	yyout = fopen(argv[2], "w");
	FILE* symbols = fopen(argv[3], "w");
	fprintf(yyout, "单词\t\t词素\t\t属性\t\t\n");
	yylex();
	printsymbols(symbols);
	fclose(symbols);
	return 0;
}

