CC = gcc
CFLAGS = -g -Wall -Wextra -Werror -fno-pic -masm=intel

.PHONY: all clean

all: main


# TODO: Add dependecies here so that the Makefile works
main: main.c
	$(CC) -c main.c
	$(CC) main.o shop.o -o main

run:
	./main

clean:
	-rm -f main main.o