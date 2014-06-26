//Top Down Parser.

//Header Files
#include<iostream.h>
#include<stdio.h>
#include<conio.h>

//Function Used
int S();
int A();
int C();
void adv();

char ch[120];
int i=0;   				//assigning pointer to zero

void main()
{
	cout<<"Grammar ";
	cout<<"\n\t S->aAb | cA" ;
	cout<<"\n\t A->cC";
	cout<<"\n\t C->cd";
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
			if((ch[i]=='b') && (ch[i+1]=='\0'))
				return (1);
			else return(0);
			}
		else return(0);
	}
	else
	//////
	if (ch[i]=='c')
		{
		adv();
		if(A())
			{
			if(ch[i+1]=='\0')
				return (1);
			else return(0);
			}
		else return(0);
      }
	else return(0);
}

int A()
{
	if(ch[i]=='c')
		{
   	adv();
		if(C())
			return(1);
		else return(0);
		}
	else return(0);
}

int C()
{
		if(ch[i]=='c')
				{
   			adv();
				if(ch[i]=='d')
					return(1);
				else return(0);
				}
		else return(0);
}

void adv()
{
	i=i+1;      //advances the pointer
}