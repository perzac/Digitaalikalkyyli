CC=gcc

INC = ${HOME}/include
OBJ = ${HOME}/lib
BIN = ${HOME}/bin

all: $(BIN)/laske_alkulukuja

$(BIN)/laske_alkulukuja : $(OBJ)/laske_alkulukuja.o
	$(CC) -o $(BIN)/laske_alkulukuja $(OBJ)/laske_alkulukuja.o \
	$(OBJ)/ariutils.o

$(OBJ)/laske_alkulukuja.o: laske_alkulukuja.c $(INC)/ariutils.h
	$(CC) -c -I$(INC) -o $(OBJ)/laske_alkulukuja.o laske_alkulukuja.c

clean:
	rm $(OBJ)/laske_alkulukuja.o $(BIN)/laske_alkulukuja
