%{ 
#include <stdio.h>
void yyerror(char *);
#include "y.tab.h"
int yylval;
%}
%% 
[0]+		{return $;}
[001]?		{return A;}
[11]*		{return T;}
"exit"		{return EXIT;}
[ \t]		;/*skip white spaces */
.		yyerror("invalid character");
%%
