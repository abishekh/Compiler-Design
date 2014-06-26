%{ 
#include <stdio.h>
void yyerror(char *);
#include "y.tab.h"
int yylval;
%}
%% 
[001]		{return TOKEN1;}
[0]		{return TOKEN2;}
[11]		{return TOKEN3;}
"exit"		{return EXIT;}
[ \t]		;/*skip white spaces */
.		yyerror("invalid character");
%%
