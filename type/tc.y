%{
#include <stdio.h>
#include<string.h>
#define YYSTYPE char*
int yylex(void);

void yyerror(const char *s)
{
	fprintf(stderr,"error: %s\n",s);

}

int yywrap()
{
	return 1;
}

main()
{
yyparse();
}
%}
%token NUM
%token ID
%start S
%%
S:E {printf("The equivalent postfix expression is %s\n",$1);}
;

E: E '+' T 	{ $$=(char*)calloc(strlen($1)+strlen($3)+1,sizeof(char));
	   	  strcat($$,$1);
		  strcat($$,$3);
		  strcat($$,"+");
		}
|T		{$$=$1;}
;

T:T'*'F 	{$$=(char*)calloc(strlen($1)+strlen($3)+1,sizeof(char));
		strcat($$,$1);
		strcat($$,$3);
		strcat($$,"*");
		}	
 |F		{$$=$1;}
;

F:NUM	{$$=$1;}
 | ID   {$$=$1;}
 ;		
%%


