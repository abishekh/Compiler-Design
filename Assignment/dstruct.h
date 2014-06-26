#ifndef DSTRUCT_H
#define DSTRUCT_H

#include <stdio.h>
#include <string.h>
#include <malloc>
enum RELATION {NONE, USING_R,HAS_A_R, KIND_OF_R };
enum BOOL {FALSE,TRUE };

typedef struct COLABR {
                 char* className;
                 RELATION relation;
                 COLABR *next;
               }COLABR ;

typedef struct  ATTR {
               char *attribute;
               ATTR *next;
             } ATTR;

typedef struct RESPONS{
               char *methodName;
               ATTR *attribute;
               RESPONS *next;
               }RESPONS;

typedef struct CARD {
               char *className;
               RESPONS *responsibility;
               COLABR  *colabration;
					CARD *next;
               } CARD;

COLABR *getNewColbr();
RESPONS *getNewResp();
CARD *getNewCard();
ATTR *getNewAttr();
void generatePseudoCode(CARD *cardList,FILE* fp);
void displayDataStruct(CARD *cardList);
#endif