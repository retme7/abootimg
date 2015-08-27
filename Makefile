CC=gcc
CFLAGS=-O3 -Wall -I.
DEPS = bootimg.h version.h fmemopen.h
OBJ = fmemopen.o abootimg.o

all: abootimg

version.h:
	if [ ! -f version.h ]; then \
	if [ -d .git ]; then \
	echo '#define VERSION_STR "$(shell git describe --tags --abbrev=0)"' > version.h; \
	else \
	echo '#define VERSION_STR ""' > version.h; \
	fi \
	fi

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

abootimg: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -f abootimg *.o version.h

.PHONY:	clean all
