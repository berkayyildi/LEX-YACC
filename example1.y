%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
int paran	=0;		//PARANTEZ SAYIMINDA KULLANILIYOR ERROR VARMI BAKMAK ICIN
int curlyparan	=0;	//SUSLU PARANTEZ SAYIMINDA KULLANILIYOR ERROR VARMI BAKMAK ICIN
extern FILE *yyin;
%}
%token SHELLPREDIRECTIVE SINGLELINECOMMENT STRINGDOUBLEQ STRINGONEQ RWPRINT RWPRINTF RWIF RWELSE RWELSIF RWWHILE RWLOOPNEXT RWLOOPLAST EQUALSYMBOL SEMICOLON ISEQUAL SMALLER BIGGER PLUSSIGN IDENT ARRAYIDENT NUMBER FLOAT OPENPAREN CLOSEPAREN OPENBRACKET CLOSEBRACKET CONCAT CONCATVARS PLUSSEDNUMBERS MULTIPLESIGN NUMBERSEQUENCE STRINGSEQUENCE COMPAREST MULTIPLEDNUMBERS
%%
commands:
	| commands command
	;

command:
	| shellstart | commentcatch | printdoubleqstring | printfdoubleqstring | printsingleqstring | numassignment
	| stringassignment | floatassignment | intarraycreate | stringarraycreate | concatstr
	| addnum | multipnum | concatvar | ifstatementwithcomprare | ifstatementvar | blockclose | varvarplusnum
	| else | elsif | while | loopnext | looplast
	;

shellstart:
	SHELLPREDIRECTIVE
	{
		printf("\tSHELL STARTED\n");		
	}
	;

commentcatch:
	SINGLELINECOMMENT
	{
		printf("\tCOMMENT\n");		
	}
	;

loopnext:
	RWLOOPNEXT SEMICOLON
	{
		printf("\tLOOP NEXT\n");		
	}
	;

looplast:
	RWLOOPLAST SEMICOLON
	{
		printf("\tLOOP LAST\n");		
	}
	;
printfdoubleqstring:
	RWPRINTF STRINGDOUBLEQ SEMICOLON
	{
		printf("\tPRINTF DOUBLE QUOTE STRING\n");		
	}
	;

printdoubleqstring:
	RWPRINT STRINGDOUBLEQ SEMICOLON
	{
		printf("\tPRINT DOUBLE QUOTE STRING\n");		
	}
	;

printsingleqstring:
	RWPRINT STRINGONEQ SEMICOLON
	{
		printf("\tPRINT SINGLE QUOTE STRING\n");		
	}
	;

numassignment:
	IDENT EQUALSYMBOL NUMBER SEMICOLON
	{
		printf("\tASSIGNMENT NUMBER\n");		
	}
	;

stringassignment:
	IDENT EQUALSYMBOL STRINGDOUBLEQ SEMICOLON
	{
		printf("\tASSIGNMENT STRING\n");		
	}
	;

floatassignment:
	IDENT EQUALSYMBOL FLOAT SEMICOLON
	{
		printf("\tASSIGNMENT FLOAT\n");		
	}
	;

intarraycreate:
	ARRAYIDENT EQUALSYMBOL OPENPAREN NUMBERSEQUENCE CLOSEPAREN SEMICOLON
	{
		paran ++;
		paran --;
		printf("\tINT ARRAY CREATE\n");		
	}
	;

stringarraycreate:
	ARRAYIDENT EQUALSYMBOL OPENPAREN STRINGSEQUENCE CLOSEPAREN SEMICOLON
	{
		paran ++;
		paran --;
		printf("\tSTRING ARRAY CREATE\n");		
	}
	;

concatstr:
	IDENT EQUALSYMBOL CONCAT SEMICOLON
	{
		printf("\tCONCAT STRING\n");		
	}
	;

concatvar:
	IDENT CONCATVARS SEMICOLON		//BURDA EQUAL YOK CUNKU QUAL LEX TE RE DE ALINIYOR ZATEN
	{
		printf("\tCONCAT VARIABLES\n");		
	}
	;


addnum:
	IDENT EQUALSYMBOL PLUSSEDNUMBERS SEMICOLON
	{
		printf("\tADD NUMBERS\n");		
	}
	;

multipnum:
	IDENT EQUALSYMBOL MULTIPLEDNUMBERS SEMICOLON
	{
		printf("\tMULTIPLE NUMBERS\n");		
	}
	;

varvarplusnum:
	IDENT EQUALSYMBOL IDENT PLUSSIGN NUMBER SEMICOLON
	{
		printf("\tVAR=VAR+NUM\n");		
	}
	;

ifstatementwithcomprare:
	RWIF OPENPAREN COMPAREST CLOSEPAREN OPENBRACKET
	{
		curlyparan ++;
		paran ++;
		paran --;
		printf("IF STATEMENT BLOCK WITH LOGIC COMPARISON\n");		
	}
	;


ifstatementvar:
	RWIF OPENPAREN IDENT CLOSEPAREN OPENBRACKET
	{
		curlyparan ++;
		paran ++;
		paran --;
		printf("IF STATEMENT BLOCK WITH VARIABLE\n");		
	}
	;

blockclose:
	CLOSEBRACKET
	{
		curlyparan --;
		printf("BLOCK CLOSE\n");		
	}
	;

else:
	CLOSEBRACKET RWELSE OPENBRACKET
	{
		curlyparan --;
		curlyparan ++;
		printf("ELSE BLOCK\n");		
	}
	;

elsif:
	CLOSEBRACKET RWELSIF OPENPAREN COMPAREST CLOSEPAREN OPENBRACKET
	{
		curlyparan --;
		curlyparan ++;
		paran ++;
		paran --;
		printf("ELSIF BLOCK\n");		
	}
	;

while:
	RWWHILE OPENPAREN COMPAREST CLOSEPAREN OPENBRACKET
	{
		curlyparan ++;
		paran ++;
		paran --;
		printf("\tWHILE BLOCK\n");		
	}
	;


	
%%
void yyerror(char *s){
	extern int yylineno2;
	fprintf(stderr,"error: %s | Line Number: %i\n",s,yylineno2);
}
int yywrap(){
	return 1;
}
int main(int argc, char *argv[])
{
    /* Call the lexer, then quit. */
    yyin=fopen(argv[1],"r");
    yyparse();
	if (paran | curlyparan) {	fprintf(stderr,"\nPARANTESIS error!\n");	}	//PARANTEZLER TUTMAZSA HATA VERIR
    fclose(yyin);
    return 0;
}
