%{ 
#include <stdio.h>
void yyerror(char *);
#include "y.tab.h"
int yylval;
%}
%% 
[0-9]+	{
		yylval=atoi(yytext); 
		return INTEGER;
	} 
[-+\n]		return *yytext;
[ \t]		;/*skip white spaces */
.		yyerror("invalid character");
%%

