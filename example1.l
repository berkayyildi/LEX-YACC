%{
int yylineno2=1;
#include <stdio.h>
#include "y.tab.h"
%}
%%	

%option yylineno2;

"#!/usr/bin/perl" 		return SHELLPREDIRECTIVE;	//Predirective i direk olarak aynısını arar
#.* 				return SINGLELINECOMMENT;	//# işaratinden sonraki şeyleri yorum olarak kabul eder
\"(\\.|[^"\\])*\"		return STRINGDOUBLEQ;		//"Birşeyler" şeklinde string araması yapar
\'(\\.|[^'\\])*\'		return STRINGONEQ;		//'Birşeyler' şeklinde string araması yapar
"printf"			return RWPRINTF;		//Printf Reserved Word olduğu gibi arar
"print"				return RWPRINT;			//Print Reserved Word olduğu gibi arar
"if"				return RWIF;			//If Reserved Word olduğu gibi arar
"else"				return RWELSE;			//else Reserved Word olduğu gibi arar
"elsif"				return RWELSIF;			//elsif Reserved Word olduğu gibi arar
"while"				return RWWHILE;			//while Reserved Word olduğu gibi arar
"next"				return RWLOOPNEXT;		//next Reserved Word olduğu gibi arar
"last"				return RWLOOPLAST;		//last Reserved Word olduğu gibi arar
"="				return EQUALSYMBOL;		//Equal sign arar
";"				return SEMICOLON;		//Semicolumn sign arar
"=="				return ISEQUAL;			//Equal Equal sign arar
"<"				return SMALLER;			//Smaller sign arar
">"				return BIGGER;			//Bigger sign arar
\+				return PLUSSIGN;		//Plus sign arar
\$([A-Za-z])+ 			return IDENT;			//$bişeyler (perl variable) arar
@([A-Za-z])+ 			return ARRAYIDENT;		//[At]bişeyler (perl array) arar
[0-9]+ 				return NUMBER;			//Sayi araması yapar
[+-]?([0-9]*[.])?[0-9]+		return FLOAT;			//+-Sayi.Sayi kalıbına uyanları bulur .5 vs dahil
"("				return OPENPAREN;		//Open Paran araması yapar
")"				return CLOSEPAREN;		//Close Paran araması yapar
"{"				return OPENBRACKET;		//Open CurlyBracket araması yapar
"}"				return CLOSEBRACKET;		//Close CurlyBracket araması yapar
\"[^;.]*\"			return STRINGSEQUENCE;		//"a", "b" kalıbını arar (Perl array)
\"[^;,]*\"			return CONCAT;			//"string" . "string" kalıbını arar  (Perl string concat)
=" "\$([A-Za-z].[^;]*)+		return CONCATVARS;		// = $a . $b gibi kalip concat araması yapar
[0-9]*" "*\+" "*[0-9]*		return PLUSSEDNUMBERS;		//5 + 2 ... gibi arama yapar
[0-9]*" "*\*" "*[0-9]*		return MULTIPLEDNUMBERS;	// 6 * 5 * 8 ... gibi arama yapar
\*				return MULTIPLESIGN;		//Yıldız işaretini arar
([0-9].*[0-9])+			return NUMBERSEQUENCE;		//Integer arrayinde dizili sayilari yakalar
\$([A-Za-z])+" "*(<|==|>)" "*([0-9]+)	return COMPAREST;	// $a < 50, $a > 50, $a == 50 yi kapsar logic comparison yani


[\n]        {yylineno2++;}					//Line number sayimi yapar
[ \t]+
%%
