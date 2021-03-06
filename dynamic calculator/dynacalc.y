%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#define NVARS 100
int yylex(void);
char *vars[NVARS];
double vals[NVARS];
int nvars=0;
int yywrap()
{
return 1;
}

%}
                                                   
%union { double dval; int ivar; }
%token <dval> DOUBLE
%token <ivar> NAME
%type <dval> expr
%type <dval> mulex
%type <dval> term
%%

program:
        line program		
        |line			
	;
line:
        expr '\n'              { printf("%g \n",$1); }
        | NAME '=' expr '\n'   { vals[$1] = $3;printf("Value:%g \n",$3); }
	;
expr:
        expr '+' mulex       { $$ = $1 + $3; }
        | expr '-' mulex     { $$ = $1 - $3; }
        | mulex              { $$ = $1; }
	;
mulex:
        mulex '*' term       { $$ = $1 * $3; }
        | mulex '/' term     { $$ = $1 / $3; }
        | term               { $$ = $1; }
	;
term:
        '(' expr ')'         { $$ = $2; }
        | NAME               { $$ = vals[$1]; }
        | DOUBLE             { $$ = $1; }
	;
%%

void yyerror(char *s)
{
fprintf(stderr,"%s\n",s);
}


int varindex(char *var)
{
  int i;
  for (i=0; i<nvars; i++)
    if (strcmp(var,vars[i])==0) return i;
  vars[nvars] = strdup(var);
  return nvars++;
}
int main(void)
{
    /*yydebug=1;*/
    yyparse();
    return 0;
}

