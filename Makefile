# (c) Copyright 2019 Bartosz Mierzynski

CC=cc
CFLAGS=-Wall -pedantic -ansi -O2

all:
	@$(CC) $(CFLAGS) rand.c -o rand

.PHONY: clean

clean:
	@rm rand
