CC=gcc
CFLAGS=-O3
BIN = bsf
SRC = bsf.c
OBJ = $(SRC:.c=.o) 

all: $(BIN)

debug: CFLAGS += -DDEBUG
debug: $(BIN)

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

$(BIN): $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

.PHONY: clean

install:
	cp bsf /usr/local/bin/bsf
	cp boroscope /usr/local/bin/boroscope
	chmod 755 /usr/local/bin/boroscope /usr/local/bin/bsf

uninstall:
	rm -f /usr/local/bin/bsf /usr/local/bin/boroscope

clean:
	rm -f $(BIN) *.o   
