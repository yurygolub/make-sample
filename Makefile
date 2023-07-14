CC=clang
INCDIRS=-I.
OPT=-O0
CFLAGS=$(INCDIRS) $(OPT)

CFILES=main.c test.c
OBJECTS=main.o test.o

BINARY=main.exe

all: $(BINARY)

$(BINARY): $(OBJECTS)
	$(CC) -o $@ $^

%.o:%.c
	$(CC) $(CFLAGS) -c -o $@ $^

clean:
	del /q $(BINARY) $(OBJECTS)
