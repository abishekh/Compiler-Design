%{
#include <stdio.h>
#include <string.h>
 
void yyerror(const char *str)
{
        fprintf(stderr,"error: %s\n",str);
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


%token IF
%token LPAREN
%token OP
%token RPAREN
%token LBRACE
%token RBRACE
%token ELSE
%token SEMICOLON 
%token ID 
%token NUM 
%token ASSIGN
%token ERROR


%%
complete:
	|part1 part2
	|part1
	;
	
part2: ELSE LBRACE stmt RBRACE								{printf("- ELSE Parsed");} 		
;	

part1:complete IF LPAREN condition RPAREN LBRACE stmt RBRACE				{printf("IF Parsed");}
	;

condition:ID OP NUM									//{printf("1, ");}
	;


stmt: ID ASSIGN expr SEMICOLON                 						//{ printf("2, "); }
   ;

expr :                             							//{ printf("3, "); }
      NUM                           							//{ printf("4, "); }
     ;

%%

