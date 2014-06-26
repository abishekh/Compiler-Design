//Top Down Parser.

//Header Files
#include<iostream.h>
#include<stdio.h>
#include<conio.h>

//Function Used
int S();
int A();
int B();
void adv();

char ch[120];
int i=0;   				//assigning pointer to zero

void main()
{
	cout<<"Grammar ";
	cout<<"\n\t S->aAa " ;
	cout<<"\n\t A->fB";
	cout<<"\n\t B->de";
 	cout<<"\n\nEnter the word ";
	gets(ch);
	if(S()) cout<<"\nWord is valid for the given grammar";
   else cout<<"\nWord is invalid according to the given grammar";
   getch();
}

int S()
{
	if(ch[i]=='a')
	{
   	adv();
		if(A())
			{
			adv()  ;
			if((ch[i]=='a') && (ch[i+1]=='\0'))
				return (1);
			else return(0);
			}
		else return(0);
	}

	else return(0);
}

int A()
{
	if(ch[i]=='f')
		{
		adv();
		if(B())
			return(1);
		else return(0);
		}
	else return(0);
}

int B()
{
		if(ch[i]=='d')
				{
				adv();
				if(ch[i]=='e')
					return(1);
				else return(0);
				}
		else return(0);
}

void adv()
{
	i=i+1;      //advances the pointer
}