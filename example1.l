%{
int yylineno2=1;
#include <stdio.h>
#include "y.tab.h"
%}
%%	

%option yylineno2;

"#!/usr/bin/perl" 		return SHELLPREDIRECTIVE;
#.* 				return SINGLELINECOMMENT;
\"(\\.|[^"\\])*\"		return STRINGDOUBLEQ;
\'(\\.|[^'\\])*\'		return STRINGONEQ;
"print"|"while"|"next"|"last"	return RESERVEDWORD;
"="				return EQUALSYMBOL;
";"				return SEMICOLON;
"=="				return ISEQUAL;
"<"				return SMALLER;
">"				return BIGGER;
$([A-Za-z])+ 			return IDENT;
@([A-Za-z])+ 			return ARRAYIDENT;
[0-9]+ 				return NUMBER;
[+-]?([0-9]*[.])?[0-9]+		return FLOAT;
"("				return OPENPAREN;
")"				return CLOSEPAREN;
"{"				return OPENBRACKET;
"}"				return CLOSEBRACKET;
\.				return CONCAT;
"+"				return PLUSSIGN;
"*"				return MULTIPLESIGN;
([0-9].*[0-9])+			return NUMBERSEQUENCE;
[0-9]+(" ")*\+(" ")*[0-9]+	return NUMPLUSNUM;


[\n]        {yylineno2++;}
[ \t]+
%%
