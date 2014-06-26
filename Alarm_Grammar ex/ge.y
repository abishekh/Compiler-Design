%{
#include <stdio.h>
#include<string.h>
int flag;
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

%token TOKEN1;
%token TOKEN2;
%token EXIT;
%%

command:
	|first ex		
	|second	ex	
	|ex		
	;
first:	first TOKEN1		{printf("\tFirst alarm Activated\n");}
	|first		
	;
second:	second TOKEN2		{printf("\tSecond Alarm Activated\n");}
	|second 	
	;
ex:
	EXIT 		{printf("\tSystem Exitted\n");exit(0);}
	;
%%
