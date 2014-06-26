C++=/sun/pollux/home1/home/lang/CC-4.0.1 -Dsun4  -g
crc: main.o crcy.o crcl.o dstruct.o
        $(C++) -DEXTERNC -I/. crcl.o  crcy.o dstruct.o main.o  -o crc
crcl.o: ../lex/crc.l
        /usr/lang/lex++ ../lex/crc.l
        mv lex.yy.c crcl.cxx
        $(C++). -c crcl.cxx -o crcl.o
crcy.o: crc.y
        /usr/lang/yacc++ -dvt crc.y
        mv y.tab.c crcy.cxx
        $(C++) -c crcy.cxx -o crcy.o
main.o: main.cxx
        $(C++) -c main.cxx -o main.o
dstruct.o:dstruct.c
        $(C++) -c dstruct.c -o dstruct.o



