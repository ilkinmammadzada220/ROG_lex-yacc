%{
void yyerror (char *s);
int yylex();
#include <stdio.h>		 /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
int symbols[52];
int symbolVal(char symbol);
void updateSymbolVal(char symbol, int val);
%}

%token printit			/* Yacc definitions */
%token exit_command
%token NUM CHAR
%token BOOL
%token IF ELSE FOR WHILE
%token AND OR
%left G L GE LE E
%left or and


%%

/* descriptions of expected inputs     corresponding actions (in C) */

line    : stmt';'				{;}
		| exit_command ';'		{exit(EXIT_SUCCESS);}
		| printit exp ';'			{printf("Printing %d\n", $2);}
		| line assignment ';'		{;}
		| line print exp ';'		{printf("Printing %d\n", $3);}
		| line exit_command ';'		{exit(EXIT_SUCCESS);}
        ;
stmt:
         assignment ';'                 	{;}
	| exit_command ';'			{exit(EXIT_SUCCESS);}
        | exp ';'                       	{ $$ = $1; }
        | printit exp ';'               	{ printf("Printed %d\n", $2);}
	| ifstmt
	| forloop
	| whileloop
        | '{' stmt_list '}'             	{ $$ = $2; }
        ;

stmt_list:
          stmt                  		{ $$ = $1; }
        | stmt_list stmt        
        ;
assignment : CHAR '=' exp  			{ updateSymbolVal($1,$3); }
			;
exp    	: term                  {$$ = $1;}
       	| exp '+' term          {$$ = $1 + $3;}
       	| exp '-' term          {$$ = $1 - $3;}
	| exp '*' term          {$$ = $1 * $3;}
	| exp '/' term          {$$ = $1 / $3;}
       	;
term:
	NUM			{$$ = $1;}
	| CHAR			{$$ = symbolVal($1);} 
        ;
ifstmt:
	IF '(' conds ')' stmt	{if($3 == 1)			{return $$=$5;}}
	| IF '(' conds ')' stmt ELSE ifstmt {if($3 == 1)	{return $$=$5;}else{$$=$7;}}
	;
forloop:
	FOR '(' exp ';' exp ';' exp ')' stmt
	;
whileloop:
	WHILE '(' exp ')' stmt
	;
conds:
	cond
	| cond AND conds
	| cond OR conds
	;
	cond:
		exp
		| exp GE exp
		| exp LE exp
		| exp G exp
		| exp L exp
		| exp E exp
		;
%%                     

int computeSymbolIndex(char token)
{
	int idx = -1;
	if(islower(token)) {
		idx = token - 'a' + 26;
	} else if(isupper(token)) {
		idx = token - 'A';
	}
	return idx;
} 

/* returns the value of a given symbol */
int symbolVal(char symbol)
{
	int bucket = computeSymbolIndex(symbol);
	return symbols[bucket];
}

/* updates the value of a given symbol */
void updateSymbolVal(char symbol, int val)
{
	int bucket = computeSymbolIndex(symbol);
	symbols[bucket] = val;
}

int main (void) {
	/* init symbol table */
	int i;
	for(i=0; i<52; i++) {
		symbols[i] = 0;
	}

	return yyparse ( );
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 

