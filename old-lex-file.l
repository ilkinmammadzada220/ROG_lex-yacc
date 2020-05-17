%{
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
static bool check_triangle(int a, int b, int c);

%}

%%
"kathetus_1" {printf(" |FIRST KATHETUS| ");}
"kathetus_2" {printf(" |SECOND KATHETUS| ");}
"hypotenus" {printf(" |HYPOTENUS| ");}

".:.".* {/* consume .:. -comment */}

"int" {printf(" |INTEGER_TYPE| ");}
"double" {printf(" |DOUBLE_TYPE| ");}

"true" {printf(" |isTRUE| ");}

"false" {printf(" |isFALSE| ");}
[0-9]* {printf(" |INTEGER| ");}
[0-9].\

";" {printf(" |SEMICOLON| ");}
"==" {printf(" |isEQUAL| ");}
"(" {printf(" |PARANTHESIS OPENED| ");}
")" {printf(" |PARANTHESIS CLOSED| ");}
"+" {printf(" |PLUS| ");}
"-" {printf(" |MINUS| ");}
"*" {printf(" |MULTIPLY| ");}
"/" {printf(" |DIVIDE| ");}
">>" {printf(" |isVERYVERY GREAT THAN| ");}
"<<" {printf(" |isVERYVERY LESS THAN| ");}
">=" {printf(" |isGREATER BUT CLOSE TO| ");}
"=<" {printf(" |isLESS BUT CLOSE TO| ");}
"||" {printf(" |OR| ");}
"&&" {printf(" |AND| ");}

"=" {printf(" |EQUAL TO| ");}

">" {printf(" |isGREATER THAN |");}

"<" {printf(" |isLESS THAN| ");}

"if" {printf(" |IF CASE| ");}
"else" {printf(" |ELSE CASE| ");}
"while" {printf(" |WHILE LOOP| ");}
"for" {printf(" |FOR LOOP| ");}
"switch" {printf(" |SWITCH CASE| ");}
"case" {printf(" |CASE| ");}
"{" {printf(" |CURLY BRACKET OPENED| ");}
"}" {printf(" |CURLY BRACKET CLOSED| ");}
[a-zA-z][a-zA-Z0-9]* {printf(" |VARIABLE( %s )| ",yytext);}

. {}
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