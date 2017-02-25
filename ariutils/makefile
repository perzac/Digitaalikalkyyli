CC = gcc

BIN = ${HOME}/bin

INC = ${HOME}/include

OBJ = ${HOME}/lib

USEDIRS = $(BIN) $(INC) $(OBJ)

DIRS = ariutils liittymät laske_alkulukuja

.PHONY: $(DIRS)

all: $(USEDIRS) $(INC)/ariutils.h $(DIRS)

$(USEDIRS):
	mkdir -p $@

$(INC)/ariutils.h: $(USEDIRS)
	cp include/ariutils.h $(INC)/ariutils.h

liittymät: ariutils

laske_alkulukuja: liittymät ariutils

$(DIRS): $(INC)/ariutils.h
	$(MAKE) -C $@

clean:
	for d in $(DIRS); \
	do \
		$(MAKE) -C $$d clean; \
	done; \
	rm $(INC)/ariutils.h
