%{
#include "y.tab.h"
#include <stdio.h>
#include <string.h>
void yyerror(char *);
extern char yylval;


%}
DIGIT [0-9]
ID [A-zA-Z][a-zA-Z 0-9]*
%%

{DIGIT}+			{yylval=(char*)calloc(yyleng,sizeof(char));
			strcpy(yylval,yytext);
				return(NUM);				
				}
{ID}				{yylval=(char*)calloc(yyleng,sizeof(char));
				strcpy(yylval,yytext);
				return(ID);
				}
[\t];		
return(yytext[0]);

%%

