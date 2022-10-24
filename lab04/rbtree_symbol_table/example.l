%option noyywrap
%{
#define IN_LEX
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
LBRACE	\{
RBRACE	\}
SEMICOLON	;
COMMA	,
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
RETURN	return
ID	[A-Za-z_][0-9A-Za-z_]*
BLOCKCOMMENTBEGIN \/\*
BLOCKCOMMENTELEMENT .
BLOCKCOMMENTEND \*\/
%x BLOCKCOMMENT
LINECOMMENT \/\/[^\n]*

%%

{DECIMAL}	{
		value.ival = atoi(yytext);
		#ifdef IN_LEX
		fprintf(yyout, "DECIMAL\t\t%s\t\t%d\n", yytext, value.ival);
		#else
		return DECIMAL;
		#endif	
	}
{OCTAL}	{
		sscanf(yytext, "%o", &value.ival);
		#ifdef IN_LEX
		fprintf(yyout, "OCTAL\t\t%s\t\t%d\n", yytext, value.ival);
		#else
		return OCTAL;
		#endif	
	}
{HEXADECIMAL}	{
		sscanf(yytext, "%x", &value.ival);
		#ifdef IN_LEX
		fprintf(yyout, "HEXADECIMAL\t\t%s\t\t%d\n", yytext, value.ival);
		#else
		return HEXADECIMAL;
		#endif
	}
{FLOATCONST}	{
		value.fval = atof(yytext);
		#ifdef IN_LEX
		fprintf(yyout, "DOUBLE\t\t%s\t\t%f\n", yytext, value.fval);
		#else
		return FLOATCONST;
		#endif
	}
{INT}	{
		#ifdef IN_LEX
		fprintf(yyout, "INT\t\t%s\n", yytext);
		#else
		return INT;
		#endif
	}
{FLOAT}	{
		#ifdef IN_LEX
		fprintf(yyout, "FLOAT\t\t%s\n", yytext);
		#else
		return FLOAT;
		#endif
	}
{IF}	{
		#ifdef IN_LEX
		fprintf(yyout, "IF\t\t%s\n", yytext);
		#else
		return IF;
		#endif
	}
{LBRACE}	{
		current_level++;
		old_index = current_index;
		current_index = 0;
		#ifdef IN_LEX
		fprintf(yyout, "LBRACE\t\t%s\n", yytext);
		#else
		return LBRACE;
		#endif
	}
{RBRACE}	{
		current_level--;
		current_index++;
		current_index = old_index;
		#ifdef IN_LEX
		fprintf(yyout, "RBRACE\t\t%s\n", yytext);
		#else
		return RBRACE;
		#endif
	}
{SEMICOLON}	{
		#ifdef IN_LEX
		fprintf(yyout, "SEMICOLON\t\t%s\n", yytext);
		#else
		return SEMICOLON;
		#endif
	}
{LPAREN}	{
		#ifdef IN_LEX
		fprintf(yyout, "LBRACE\t\t%s\n", yytext);
		#else
		return LPAREN;
		#endif
	}
{RPAREN}	{
		#ifdef IN_LEX
		fprintf(yyout, "RBRACE\t\t%s\n", yytext);
		#else
		return RPAREN;
		#endif
	}
{EQ}	{
		#ifdef IN_LEX
		fprintf(yyout, "EQ\t\t%s\n", yytext);
		#else
		return EQ;
		#endif
	}
{ASSIGN}	{
		#ifdef IN_LEX
		fprintf(yyout, "ASSIGN\t\t%s\n", yytext);
		#else
		return ASSIGN;
		#endif
	}
{PLUS}	{
		#ifdef IN_LEX
		fprintf(yyout, "PLUS\t\t%s\n", yytext);
		#else
		return PLUS;
		#endif
	}
{SUB}	{
		#ifdef IN_LEX
		fprintf(yyout, "SUB\t\t%s\n", yytext);
		#else
		return SUB;
		#endif
	}
{MULTI}	{
		#ifdef IN_LEX
		fprintf(yyout, "MULTI\t\t%s\n", yytext);
		#else
		return MULTI;
		#endif
	}
{DIVIDE}	{
		#ifdef IN_LEX
		fprintf(yyout, "DIVIDE\t\t%s\n", yytext);
		#else
		return DIVIDE;
		#endif
	}
{LAND}	{
		#ifdef IN_LEX
		fprintf(yyout, "LAND\t\t%s\n", yytext);
		#else
		return LAND;
		#endif
	}
{LOR}	{
		#ifdef IN_LEX
		fprintf(yyout, "LOR\t\t%s\n", yytext);
		#else
		return LOR;
		#endif
	}
{LNOT}	{
		#ifdef IN_LEX
		fprintf(yyout, "LNOT\t\t%s\n", yytext);
		#else
		return LNOT;
		#endif
	}
{AND}	{
		#ifdef IN_LEX
		fprintf(yyout, "AND\t\t%s\n", yytext);
		#else
		return AND;
		#endif
	}
{OR}	{
		#ifdef IN_LEX
		fprintf(yyout, "OR\t\t%s\n", yytext);
		#else
		return OR;
		#endif
	}
{NOT}	{
		#ifdef IN_LEX
		fprintf(yyout, "NOT\t\t%s\n", yytext);
		#else
		return NOT;
		#endif
	}
{XOR}	{
		#ifdef IN_LEX
		fprintf(yyout, "XOR\t\t%s\n", yytext);
		#else
		return XOR;
		#endif
	}
{RETURN}	{
		#ifdef IN_LEX
		fprintf(yyout, "ID\t\t%s\t\t%X\n", yytext, value.symp);
		#else
		return RETURN;
		#endif
	}
{ID}	{
		value.symp = symlook(yytext, current_level, current_index);
		#ifdef IN_LEX
		fprintf(yyout, "ID\t\t%s\t\t%X\n", yytext, value.symp);
		#else
		return ID;
		#endif
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
	yyout = fopen(argv[2], "w");
	FILE* symbols = fopen(argv[3], "w");
	fprintf(yyout, "单词\t\t词素\t\t属性\t\t\n");
	yylex();
	printsymbols(symbols);
	fclose(yyout);
	fclose(symbols);
	return 0;
}
#endif

