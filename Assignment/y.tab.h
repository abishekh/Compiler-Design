#define CLASS 257
#define CRC 258
#define END 259
#define CLASSNAME 260
#define RESPONSIBILITY 261
#define COLABRATION 262
#define STRING 263
#define INT 264
#define CHAR 265
#define PTR 266
#define VARIABLE 267
#define METHODNAME 268
#define USING 269
#define HAS_A 270
#define KIND_OF 271
typedef union{
 char stval[100];
 char* ptr;
 COLABR *colbr;
 ATTR *attr;
 RESPONS *resp;
 CARD *card;
 } YYSTYPE;
extern YYSTYPE yylval;
