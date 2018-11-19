all: yacc lex
	cc lex.yy.c y.tab.c -o example1

yacc: example1.y
	yacc -d example1.y

lex: example1.l
	lex example1.l


