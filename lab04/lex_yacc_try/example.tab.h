/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_EXAMPLE_TAB_H_INCLUDED
# define YY_YY_EXAMPLE_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    WHITE = 258,
    EOL = 259,
    DECIMAL = 260,
    OCTAL = 261,
    HEXADECIMAL = 262,
    FLOATCONST = 263,
    INT = 264,
    FLOAT = 265,
    IF = 266,
    WHILE = 267,
    RETURN = 268,
    BREAK = 269,
    CONTINUE = 270,
    LBRACE = 271,
    RBRACE = 272,
    SEMICOLON = 273,
    LPAREN = 274,
    RPAREN = 275,
    EQ = 276,
    LOE = 277,
    GOE = 278,
    LT = 279,
    GT = 280,
    NEQ = 281,
    ASSIGN = 282,
    PLUS = 283,
    SUB = 284,
    MULTI = 285,
    DIVIDE = 286,
    MOD = 287,
    LAND = 288,
    LOR = 289,
    LNOT = 290,
    AND = 291,
    OR = 292,
    NOT = 293,
    XOR = 294,
    ID = 295,
    COMMA = 296,
    BLOCKCOMMENTBEGIN = 297,
    BLOCKCOMMENTELEMENT = 298,
    BLOCKCOMMENTEND = 299,
    LINECOMMENT = 300,
    ADD = 301,
    UMINUS = 302
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 10 "example.y"

	int ival;
	float fval;
	struct val *value;
	struct symitem *symp;

#line 103 "example.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_EXAMPLE_TAB_H_INCLUDED  */
