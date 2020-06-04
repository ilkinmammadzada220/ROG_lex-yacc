%{
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
static bool check_triangle(int a, int b, int c);

%}

numbers		[0-9]+
chars		[a-zA-Z]+
arithmetics	[+-/*=]


%%
"kat1"		{return KAT1;}
"kat2"		{return KAT2;}
"hyp"		{return HYP;}

".:.".*			{/* consume .:. -comment */}
{arithmetics}		{return yytext[0];}
'<'			{return G;}
'>'			{return L;}
">="			{return GE;}
"=<"			{return LE;}
"=="			{return E;}
"||"			{return or;}
"&&"			{return and;}

"print"			{return printit;}
"true"			{return BOOL;}
"false"			{return BOOL;}
"if"			{return IF;}
"else"			{return ELSE;}
"while"			{return WHILE;}
"for"			{return FOR;}
"switch"		{return SWITCH;}
"case"			{return CASE;}
{numbers}		{return NUM;}
{chars}			{return CHAR;}
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
