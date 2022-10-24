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
    LBRACE = 267,
    RBRACE = 268,
    SEMICOLON = 269,
    LPAREN = 270,
    RPAREN = 271,
    EQ = 272,
    ASSIGN = 273,
    PLUS = 274,
    SUB = 275,
    MULTI = 276,
    DIVIDE = 277,
    LAND = 278,
    LOR = 279,
    LNOT = 280,
    AND = 281,
    OR = 282,
    NOT = 283,
    XOR = 284,
    ID = 285,
    COMMA = 286,
    RETURN = 287,
    BLOCKCOMMENTBEGIN = 288,
    BLOCKCOMMENTELEMENT = 289,
    BLOCKCOMMENTEND = 290,
    LINECOMMENT = 291,
    ADD = 292,
    UMINUS = 293
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
