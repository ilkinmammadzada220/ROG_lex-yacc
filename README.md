# Programming Language Pref

## Group Members

Ilkin MAMMADZADA

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

## Explanations about the language
- Takes a file with extension .pref
- Has if, while, some methods
- You can run your program by running the makefile and giving it to myfile.pref as input:
```bash
make ./mylexfile <myfile.pref
```

## Example of output
 |INTEGER|  |First Kathetus|  |EQUAL TO|  |INTEGER|  |SEMICOLUMN|
 |INTEGER|  |Second Kathetus|  |EQUAL TO|  |INTEGER|  |SEMICOLUMN|
 |INTEGER|  |Hypotenus|  |EQUAL TO|  |INTEGER|  |SEMICOLUMN|



 |IF CASE|  |COLUMN OPENED|  |First Kathetus|  |isGREATER THAN | |Hypotenus|  |OR|  |Second Kathetus|  |isGREATER THAN | |Hypotenus|  |COLUMN CLOSED|
 |CURLY BRACKET OPENED|

 |VARIABLE( printf )|  |COLUMN OPENED|  |VARIABLE( Kathetus )|  |VARIABLE( can )|  |VARIABLE( not )|  |VARIABLE( be )|  |VARIABLE( less )|  |VARIABLE( than )|  |Hypotenus|  |COLUMN CLOSED|  |SEMICOLUMN|
 |CURLY BRACKET CLOSED|
 |IF CASE|  |COLUMN OPENED|  |First Kathetus|  |isLESS BUT CLOSE TO|  |INTEGER|  |OR|  |Hypotenus|  |isLESS BUT CLOSE TO|  |INTEGER|  |OR|  |Second Kathetus|  |isLESS BUT CLOSE TO|  |INTEGER|  |COLUMN CLOSED|
 |CURLY BRACKET OPENED|
 |VARIABLE( printf )|  |COLUMN OPENED|  |VARIABLE( Sides )|  |VARIABLE( of )|  |VARIABLE( triangle )|  |VARIABLE( can )|  |VARIABLE( not )|  |VARIABLE( be )|  |INTEGER|  |VARIABLE( or )|  |VARIABLE( less )|  |COLUMN CLOSED|  |SEMICOLUMN|
 |CURLY BRACKET CLOSED|
 |IF CASE|  |COLUMN OPENED|  |VARIABLE( check )|  |VARIABLE( _triangle )|  |COLUMN OPENED|  |First Kathetus|  |Second Kathetus|  |Hypotenus|  |COLUMN CLOSED|  |isEQUAL|  |isTRUE|  |COLUMN CLOSED|
 |CURLY BRACKET OPENED|

 |VARIABLE( printf )|  |COLUMN OPENED|  |VARIABLE( Triangle )|  |VARIABLE( is )|  |VARIABLE( Pythagorean )|  |COLUMN CLOSED|  |SEMICOLUMN|
 |CURLY BRACKET CLOSED|  |ELSE CASE|  |CURLY BRACKET OPENED|
 |VARIABLE( printf )|  |COLUMN OPENED|  |VARIABLE( Triangle )|  |VARIABLE( is )|  |VARIABLE( not )|  |VARIABLE( Pythagorean )|  |COLUMN CLOSED|  |SEMICOLUMN|
 |CURLY BRACKET CLOSED|
