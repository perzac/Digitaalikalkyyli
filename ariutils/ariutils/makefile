CC=gcc

INC=${HOME}/include
OBJ=${HOME}/lib

all: $(OBJ)/ariutils.o

$(OBJ)/ariutils.o: ariutils.c $(INC)/ariutils.h
	$(CC) -c -I$(INC) -o $(OBJ)/ariutils.o ariutils.c

clean:
	rm $(OBJ)/ariutils.o
