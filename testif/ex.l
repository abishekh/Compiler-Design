%{
#include <stdio.h>
void yyerror(char *);
int yylval;
#include "y.tab.h"

%}
%%
				
[a-z]				{return ID;}
[\t \n]*			;
"("                            { return(LPAREN);}
")"                            { return(RPAREN);}
"{"                            { return(LBRACE);}
"}"                            { return(RBRACE);}
"="                            { return(ASSIGN);}
";"                            { return(SEMICOLON);}
if                             { return(IF);}
else                           { return(ELSE);}
[0-9]+                         { return(NUM); }
[<|>|=] 		       { return(OP); }
.                              { return(ERROR);}


%%
