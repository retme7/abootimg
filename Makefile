CC=gcc
CFLAGS=-O3 -Wall -I.
DEPS = bootimg.h fmemopen.h
OBJ = fmemopen.o abootimg.o

all: abootimg

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

abootimg: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -f abootimg *.o

.PHONY:	clean all
