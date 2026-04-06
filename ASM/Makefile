NFLAGS	= -f elf64
NAMES	= Colleen Grace Sully

all: $(NAMES)

Colleen: Colleen.s
	nasm $(NFLAGS) $< -o $@.o && gcc $@.o -o $@  && rm $@.o

Grace: Grace.s
	nasm $(NFLAGS) $< -o $@.o && gcc $@.o -o $@ && rm $@.o

Sully: Sully.s
	nasm $(NFLAGS) $< -o $@.o && gcc $@.o -o $@ && rm $@.o

clean:
	rm -rf Grace_kid.s Sully_*.s $(NAMES)

refresh: clean all

.PHONY: all clean refresh
