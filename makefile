rog: rog.l rog.y
	lex rog.l
	yacc -d rog.y
	gcc -o lex.yy.c y.tab.c -ll

clean:
	rm rog lex.yy.c y.tab.c
