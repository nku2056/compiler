%option noyywrap
%{
#include "example.tab.h"
#ifdef IN_LEX
#undef IN_LEX
#endif
extern FILE* yyin;
int current_level = 0;
int current_index = 0;
int old_index = 0;
int linenum = 0;
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
WHILE while
RETURN return
BREAK break
CONTINUE continue
LBRACE	\{
RBRACE	\}
LBRACKET \[
RBRACKET \]
SEMICOLON	;
LPAREN	\(
RPAREN	\)
EQ	==
LOE <=
GOE >=
GT >
LT <
NEQ !=
ASSIGN	=
PLUS	\+
SUB	-
MULTI	\*
DIVIDE	\/
MOD %
LAND	&&
LOR	\|\|
LNOT	!
AND	&
OR	\|
NOT	~
XOR	\^
ID	[A-Za-z_][0-9A-Za-z_]*
COMMA ,
BLOCKCOMMENTBEGIN \/\*
BLOCKCOMMENTELEMENT .
BLOCKCOMMENTEND \*\/
%x BLOCKCOMMENT
LINECOMMENT \/\/[^\n]*

%%

{DECIMAL}	{
		yylval.ival = atoi(yytext);
		#ifdef IN_LEX
		fprintf(lexout, "DECIMAL\t\t%s\t\t%d\n", yytext, yylval.ival);
		#endif
		return DECIMAL;
	}
{OCTAL}	{
		sscanf(yytext, "%o", &yylval.ival);
		#ifdef IN_LEX
		fprintf(lexout, "OCTAL\t\t%s\t\t%d\n", yytext, yylval.ival);
		#endif
		return OCTAL;
	}
{HEXADECIMAL}	{
		sscanf(yytext, "%x", &yylval.ival);
		#ifdef IN_LEX
		fprintf(lexout, "HEXADECIMAL\t\t%s\t\t%d\n", yytext, yylval.ival);
		#endif
		return HEXADECIMAL;
	}
{FLOATCONST}	{
		yylval.fval = atof(yytext);
		#ifdef IN_LEX
		fprintf(lexout, "DOUBLE\t\t%s\t\t%f\n", yytext, yylval.fval);
		#endif
		return FLOATCONST;
	}
{INT}	{
		#ifdef IN_LEX
		fprintf(lexout, "INT\t\t%s\n", yytext);
		#endif
		return INT;
	}
{FLOAT}	{
		#ifdef IN_LEX
		fprintf(lexout, "FLOAT\t\t%s\n", yytext);
		#endif
		return FLOAT;
	}
{IF}	{
		#ifdef IN_LEX
		fprintf(lexout, "IF\t\t%s\n", yytext);
		#endif
		return IF;
	}
{WHILE} {
	#ifdef IN_LEX
	fprintf(lexout, "WHILE\t\t%s\n", yytext);
	#endif
	return WHILE;
}
{RETURN} {
	#ifdef IN_LEX
	fprintf(lexout, "RETURN\t\t%s\n", yytext);
	#endif
	return RETURN;
}
{BREAK} {
	#ifdef IN_LEX
	fprintf(lexout, "BREAK\t\t%s\n", yytext);
	#endif
	return BREAK;
}
{CONTINUE} {
	#ifdef IN_LEX
	fprintf(lexout, "CONTINUE\t\t%s\n", yytext);
	#endif
	return CONTINUE;
}
{LBRACE}	{
		current_level++;
		old_index = current_index;
		current_index = 0;
		#ifdef IN_LEX
		fprintf(lexout, "LBRACE\t\t%s\n", yytext);
		#endif
		return LBRACE;
	}
{RBRACE}	{
		current_level--;
		current_index++;
		current_index = old_index;
		#ifdef IN_LEX
		fprintf(lexout, "RBRACE\t\t%s\n", yytext);
		#endif
		return RBRACE;
	}
{LBRACKET}	{
		#ifdef IN_LEX
		fprintf(lexout, "LBRACKET\t\t%s\n", yytext);
		#endif
		return LPAREN;
	}
{RBRACKET}	{
		#ifdef IN_LEX
		fprintf(lexout, "RBRACKET\t\t%s\n", yytext);
		#endif
		return LPAREN;
	}
{SEMICOLON}	{
		#ifdef IN_LEX
		fprintf(lexout, "SEMICOLON\t\t%s\n", yytext);
		#endif
		return SEMICOLON;
	}
{LPAREN}	{
		#ifdef IN_LEX
		fprintf(lexout, "LBRACE\t\t%s\n", yytext);
		#endif
		return LPAREN;
	}
{RPAREN}	{
		#ifdef IN_LEX
		fprintf(lexout, "RBRACE\t\t%s\n", yytext);
		#endif
		return RPAREN;
	}
{EQ}	{
		#ifdef IN_LEX
		fprintf(lexout, "EQ\t\t%s\n", yytext);
		#endif
		return EQ;
	}
{LOE}	{
		#ifdef IN_LEX
		fprintf(lexout, "LOE\t\t%s\n", yytext);
		#endif
		return LOE;
	}
{GOE}	{
		#ifdef IN_LEX
		fprintf(lexout, "GOE\t\t%s\n", yytext);
		#endif
		return GOE;
	}
{GT}	{
		#ifdef IN_LEX
		fprintf(lexout, "GT\t\t%s\n", yytext);
		#endif
		return GT;
	}
{LT}	{
		#ifdef IN_LEX
		fprintf(lexout, "LT\t\t%s\n", yytext);
		#endif
		return LT;
	}
{NEQ}	{
		#ifdef IN_LEX
		fprintf(lexout, "NEQ\t\t%s\n", yytext);
		#endif
		return NEQ;
	}
{ASSIGN}	{
		#ifdef IN_LEX
		fprintf(lexout, "ASSIGN\t\t%s\n", yytext);
		#endif
		return ASSIGN;
	}
{PLUS}	{
		#ifdef IN_LEX
		fprintf(lexout, "PLUS\t\t%s\n", yytext);
		#endif
		return PLUS;
	}
{SUB}	{
		#ifdef IN_LEX
		fprintf(lexout, "SUB\t\t%s\n", yytext);
		#endif
		return SUB;
	}
{MULTI}	{
		#ifdef IN_LEX
		fprintf(lexout, "MULTI\t\t%s\n", yytext);
		#endif
		return MULTI;
	}
{DIVIDE}	{
		#ifdef IN_LEX
		fprintf(lexout, "DIVIDE\t\t%s\n", yytext);
		#endif
		return DIVIDE;
	}
{MOD}	{
		#ifdef IN_LEX
		fprintf(lexout, "MOD\t\t%s\n", yytext);
		#endif
		return MOD;
	}
{LAND}	{
		#ifdef IN_LEX
		fprintf(lexout, "LAND\t\t%s\n", yytext);
		#endif
		return LAND;
	}
{LOR}	{
		#ifdef IN_LEX
		fprintf(lexout, "LOR\t\t%s\n", yytext);
		#endif
		return LOR;
	}
{LNOT}	{
		#ifdef IN_LEX
		fprintf(lexout, "LNOT\t\t%s\n", yytext);
		#endif
		return LNOT;
	}
{AND}	{
		#ifdef IN_LEX
		fprintf(lexout, "AND\t\t%s\n", yytext);
		#endif
		return AND;
	}
{OR}	{
		#ifdef IN_LEX
		fprintf(lexout, "OR\t\t%s\n", yytext);
		#endif
		return OR;
	}
{NOT}	{
		#ifdef IN_LEX
		fprintf(lexout, "NOT\t\t%s\n", yytext);
		#endif
		return NOT;
	}
{XOR}	{
		#ifdef IN_LEX
		fprintf(lexout, "XOR\t\t%s\n", yytext);
		#endif
		return XOR;
	}
{ID}	{
		yylval.symp = symlook(yytext, current_level, current_index);
		#ifdef IN_LEX
		fprintf(lexout, "ID\t\t%s\t\t%X\n", yytext, yylval.symp);
		#endif
		return ID;
	}
{COMMA} {
		#ifdef IN_LEX
		fprintf(lexout, "COMMA\t\t%s\n", yytext);
		#endif
		return COMMA;
	}
{EOL}	{ linenum++; }
{WHITE}	;
{LINECOMMENT} {}
{BLOCKCOMMENTBEGIN} {BEGIN BLOCKCOMMENT;}
<BLOCKCOMMENT>{BLOCKCOMMENTELEMENT} {}
<BLOCKCOMMENT>{BLOCKCOMMENTEND} {BEGIN INITIAL;}


%%

#ifdef IN_LEX
int main(int argc, char* argv[])
{
	
	yyin = fopen(argv[1], "r");
	FILE* lexout = fopen(argv[2], "w");
	FILE* symbols = fopen(argv[3], "w");
	fprintf(lexout, "单词\t\t词素\t\t属性\t\t\n");
	yylex();
	printsymbols(symbols);
	fclose(lexout);
	fclose(symbols);
	return 0;
}
#endif

