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

%token $;
%token A;
%token T;
%token EXIT;
%%

command : 
	|command S
	;
S:
	|A P $ ex	{printf("\tParse successful!\n");}	
	|ex		
	;
P:	$		
	|T P $		
	;

ex:
	EXIT 		{printf("\tSystem Exitted\n");exit(0);}
	;
%%
