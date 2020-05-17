# Programming Language ROG

## Group Members

Ilkin MAMMADZADA


## Yacc definitions
```
%token printit		
%token exit_command
%token NUM CHAR
%token BOOL
%token IF ELSE FOR WHILE
%left G L GE LE E
%left or and
```
##Line
```
line    : stmt';'				{;}
		| exit_command ';'		{exit(EXIT_SUCCESS);}
		| print exp ';'			{printf("Printing %d\n", $2);}
		| line assignment ';'		{;}
		| line print exp ';'		{printf("Printing %d\n", $3);}
		| line exit_command ';'		{exit(EXIT_SUCCESS);}
        ;
```
## BNF
```
 <primitive type> ::= <numeric type> | boolean
 <if then statement>::= if ( <expression> ) <statement>
 <while statement> ::= while ( <expression> ) <statement>
 <return statement> ::= return <expression>
 <type name> ::= <identifier> | <package name> . <identifier>
 <digit> ::= 0 | <non zero digit>
 <boolean literal> ::= true | false
 ```
