# Programming Language ROG

## Group Members

Ilkin MAMMADZADA


### Yacc definitions
```
%token printit		
%token exit_command
%token NUM CHAR
%token BOOL
%token IF ELSE FOR WHILE
%left G L GE LE E
%left or and
```
## Used Functions

There are several functions helps us to use char array like a memory to put our identifiers to this "memory".
This function compute the certain symbol index in our memory:
```
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
```
By giving a char we get a value with this function:
```
int symbolVal(char symbol)
{
	int bucket = computeSymbolIndex(symbol);
	return symbols[bucket];
}
```
And we can update our symbol:
```
void updateSymbolVal(char symbol, int val)
{
	int bucket = computeSymbolIndex(symbol);
	symbols[bucket] = val;
}
```

## BNFs

### Line BNF

```
line    : stmt';'				{;}
		| exit_command ';'		{exit(EXIT_SUCCESS);}
		| print exp ';'			{printf("Printing %d\n", $2);}
		| line assignment ';'		{;}
		| line print exp ';'		{printf("Printing %d\n", $3);}
		| line exit_command ';'		{exit(EXIT_SUCCESS);}
        ;
```
### Statements BNF
```
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
```

### Statement List BNF
```
stmt_list:
          stmt                  		{ $$ = $1; }
        | stmt_list stmt        
        ;
```

### Assignment BNF
```
assignment : CHAR '=' exp  			{ updateSymbolVal($1,$3); }
```

### Expressions BNF
```
exp    	: term                  {$$ = $1;}
       	| exp '+' term          {$$ = $1 + $3;}
       	| exp '-' term          {$$ = $1 - $3;}
	| exp '*' term          {$$ = $1 * $3;}
	| exp '/' term          {$$ = $1 / $3;}
       	;
```

### Terms BNF
```
term:
	NUM			{$$ = $1;}
	| CHAR			{$$ = symbolVal($1);} 
```

### IF statement BNF
```
ifstmt:
	IF '(' conds ')' stmt	{if($3 == 1)			{return $$=$5;}}
	| IF '(' conds ')' stmt ELSE ifstmt {if($3 == 1)	{return $$=$5;}else{$$=$7;}}
	;
```

### FOR loop BNF
```
forloop:
	FOR '(' exp ';' exp ';' exp ')' stmt
	;
```

### WHILE loop BNF
```
whileloop:
	WHILE '(' exp ')' stmt
	;
```

### Conditions BNF
```
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
```
