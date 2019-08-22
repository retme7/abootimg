CC=gcc
CFLAGS=-O3 -Wall -I.
DEPS = src/bootimg.h scr/fmemopen.h
OBJ = src/fmemopen.o src/abootimg.o

all: cpi

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

abootimg: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) -lbsd

cpi: abootimg
	mv abootimg bin/abootimg

clean:
	rm -f bin/abootimg src/*.o

.PHONY:	clean all
