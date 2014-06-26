%{
#include <stdio.h>
#include<string.h>
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

%token INTEGER;

%%
program: 
	program expr '\n'	{ printf("The Result is :%d\n", $2); }
	|
	;


expr:
	INTEGER				{$$ = $1;}
	| expr '+' expr			{$$ = $1 + $3; }
	| expr '-' expr 		{$$ = $1 - $3; }
	| expr '*' expr 		{$$ = $1 * $3; }
	| expr '/' expr 		{$$ = $1 / $3; }
	;
%%
