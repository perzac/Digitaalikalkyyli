CC = gcc

BIN = ${HOME}/bin

INC = ${HOME}/include

OBJ = ${HOME}/lib

PRGS = alkulkm alkulukuko alkuluvut_max edellinen_alkuluku \
neliojuuri ns_alkuluku pi seuraava_alkuluku tekijoihinjako

BINS = $(foreach PRG, $(PRGS), $(BIN)/$(PRG))

OBJS = $(foreach PRG, $(PRGS), $(OBJ)/$(PRG).o)

all: $(BINS)

.SECONDARY: $(OBJS)

$(BIN)/% : $(OBJ)/%.o
	$(CC) -o $@ $< $(OBJ)/ariutils.o

$(OBJ)/%.o: %.c $(INC)/ariutils.h
	$(CC) -c -I$(INC) -o $@ $<

clean:
	rm $(OBJS) $(BINS)
