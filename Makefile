CC = gcc
CFLAGS = -g -Winline -Wl,-defsym,_DYNAMIC=0 # -pedantic -Werror -v 

OBJECTS = \
	ID_US_1.o ID_VH.o ID_VL.o WL_PLAY.C WL_DRAW.C

LIBS = -L/usr/local/lib -lX11 -L/usr/lib  -lm -ldl -lgc -lpthread
INC = -I/usr/local/include

main : $(OBJECTS) $(UT_OBJ)
	$(CC) $(CFLAGS) $(OBJECTS) WL_MAIN.C -o wolf3d $(LIBS)

%.o : %.c %.h Makefilen
	$(CC) $(CFLAGS) -c $<
clean :
	rm *.o
	rm scheme
	rm TAGS
	rm tst/*~
	rm *~

tags :
	find . -name "*.[chCH]" -print | etags -	
