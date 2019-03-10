# (c) Copyright 2019 Bartosz Mierzynski

CC=cc
CFLAGS=-Wall -pedantic -ansi

all:
	@$(CC) $(CFLAGS) rand.c -o rand

clean:
	@rm rand
