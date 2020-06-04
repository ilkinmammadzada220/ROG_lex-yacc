%{
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "y.tab.h"
static bool check_triangle(int a, int b, int c);

%}

numbers		[0-9]+
chars		[a-zA-Z]+
arithmetics	[+-/*=]


%%

".:.".*			/* consume .:. -comment */

"print"			return printit;
"true"			return BOOL;
"false"			return BOOL;
"if"			return IF;
"else"			return ELSE;
"while"			return WHILE;
"for"			return FOR;

{arithmetics}		return yytext[0];
'<'			return G;
'>'			return L;
">="			return GE;
"=<"			return LE;
"=="			return E;
"||"			return or;
"&&"			return and;


{numbers}		return NUM;
{chars}			return CHAR;
[ \t\n]+        ;       /* ignore whitespace */

.			{}
%%
int yywrap(void)
{
return 1;
}

static bool check_triangle(int a, int b, int c)
{
	int kats = a*a + b*b;
	int hyp = c*c;
	if(kats == hyp)
	{
	   return true;
	}else{
	   return false;
	}
}


int main(){
	yylex();
	return 1;
}
